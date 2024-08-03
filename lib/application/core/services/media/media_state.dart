// application/media/media_state.dart
import 'package:flutter_perfect_ddd/domain/core/models/media/media_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/core/failures.dart';

part 'media_state.freezed.dart';

@freezed
class MediaState with _$MediaState {
  const factory MediaState({
    required bool isLoading,
    required List<String> selectedImages,
    required List<MediaModel> uploadedMedia,
    required Option<Either<Failure, List<MediaModel>>> mediaOption,
  }) = _MediaState;

  factory MediaState.initial() => MediaState(
        isLoading: false,
        selectedImages: [],
        uploadedMedia: [],
        mediaOption: none(),
      );
}
