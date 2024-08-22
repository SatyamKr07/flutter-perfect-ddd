import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

@freezed
class AnimeResponse with _$AnimeResponse {
  const factory AnimeResponse({
    required List<AnimeModel> data,
    required Pagination pagination,
  }) = _AnimeResponse;

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);
}

@freezed
class AnimeModel with _$AnimeModel {
  const factory AnimeModel({
    @JsonKey(name: 'mal_id') required int malId,
    required String url,
    required Images images,
    required Trailer trailer,
    required bool approved,
    required List<Title> titles,
    required String title,
  }) = _AnimeModel;

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({
    required ImageType jpg,
    required ImageType webp,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@freezed
class ImageType with _$ImageType {
  const factory ImageType({
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'small_image_url') required String smallImageUrl,
    @JsonKey(name: 'large_image_url') required String largeImageUrl,
  }) = _ImageType;

  factory ImageType.fromJson(Map<String, dynamic> json) =>
      _$ImageTypeFromJson(json);
}

@freezed
class Trailer with _$Trailer {
  const factory Trailer({
    @JsonKey(name: 'youtube_id') required String? youtubeId,
    required String? url,
    @JsonKey(name: 'embed_url') required String?   embedUrl,
  }) = _Trailer;

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
}

@freezed
class Title with _$Title {
  const factory Title({
    required String type,
    required String title,
  }) = _Title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: 'last_visible_page') required int lastVisiblePage,
    @JsonKey(name: 'has_next_page') required bool hasNextPage,
    required PaginationItems items,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

@freezed
class PaginationItems with _$PaginationItems {
  const factory PaginationItems({
    required int count,
    required int total,
    @JsonKey(name: 'per_page') required int perPage,
  }) = _PaginationItems;

  factory PaginationItems.fromJson(Map<String, dynamic> json) =>
      _$PaginationItemsFromJson(json);
}
