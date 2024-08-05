// application/firebase/firebase_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/domain/core/models/media/media_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../domain/core/failures.dart';
import '../../../../0_core/services/firebase_service/firebase_service.dart';
import 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  final FirebaseService _firebaseService;

  FirebaseCubit(this._firebaseService) : super(FirebaseState.initial());

  Future<void> uploadImages(List<String> paths) async {
    emit(state.copyWith(isLoading: true, mediaOption: none()));
    try {
      final urls = await _firebaseService.uploadMultiImages(paths);
      final mediaList = urls
          .map((url) => MediaModel(url: url, type: MediaType.image))
          .toList();
      final updatedUploadedMedia = List<MediaModel>.from(state.uploadedMedia)
        ..addAll(mediaList);
      emit(state.copyWith(
          isLoading: false,
          uploadedMedia: updatedUploadedMedia,
          mediaOption: some(right(mediaList))));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          mediaOption: some(
              left(Failure('Failed to upload media', code: 'UPLOAD_ERROR'))),
        ),
      );
    }
  }
}
