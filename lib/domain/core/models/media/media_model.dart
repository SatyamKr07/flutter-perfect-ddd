// domain/media/media_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.freezed.dart';

@freezed
class MediaModel with _$MediaModel {
  const factory MediaModel({
    // required String id,
    required String url,
    required MediaType type,
  }) = _MediaModel;
}

enum MediaType { image, video }
