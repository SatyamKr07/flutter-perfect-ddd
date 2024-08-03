import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../application/core/services/firebase/firebase_cubit.dart';
import '../../application/core/services/firebase/firebase_state.dart';
import '../../application/core/services/media/media_cubit.dart';
import '../../application/core/services/media/media_state.dart';

class SomeActions extends StatelessWidget {
  final MediaCubit _mediaCubit = GetIt.I<MediaCubit>();
  final FirebaseCubit _firebaseCubit = GetIt.I<FirebaseCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MediaCubit>(create: (_) => _mediaCubit),
          BlocProvider<FirebaseCubit>(create: (_) => _firebaseCubit),
        ],
        child: BlocConsumer<FirebaseCubit, FirebaseState>(
          listener: (context, state) {
            state.mediaOption.fold(
              () => {},
              (either) => either.fold(
                (failure) => Fluttertoast.showToast(msg: 'Failed to upload media'),
                (media) => Fluttertoast.showToast(msg: 'Media uploaded successfully'),
              ),
            );
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _mediaCubit.pickImages(),
                  child: Text('Pick Images'),
                ),
                BlocBuilder<MediaCubit, MediaState>(
                  builder: (context, mediaState) {
                    if (mediaState.selectedImages.isNotEmpty) {
                      return Column(
                        children: [
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: mediaState.selectedImages
                                .map((path) => Image.file(File(path), width: 100, height: 100))
                                .toList(),
                          ),
                          ElevatedButton(
                            onPressed: () => _firebaseCubit.uploadImages(mediaState.selectedImages),
                            child: Text('Upload Images'),
                          ),
                        ],
                      );
                    } else if (mediaState.isLoading) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  },
                ),
                if (state.uploadedMedia.isNotEmpty) ...[
                  Divider(),
                  Text('Uploaded Media:'),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: state.uploadedMedia
                        .map((media) => Image.network(media.url, width: 100, height: 100))
                        .toList(),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
