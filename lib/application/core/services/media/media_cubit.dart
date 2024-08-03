// application/media/media_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../infrastructure/core/services/media_service/media_service.dart';
import 'media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  final MediaService _mediaService;

  MediaCubit(this._mediaService) : super(MediaState.initial());

  Future<void> pickImages() async {
    emit(state.copyWith(isLoading: true));
    final paths = await _mediaService.pickMultiImage();
    emit(state.copyWith(isLoading: false, selectedImages: paths));
  }
}
