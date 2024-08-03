part of 'anime_cubit.dart';

@freezed
class AnimeState with _$AnimeState {
  const factory AnimeState.initial() = _Initial;
  const factory AnimeState.loading() = _Loading;
  const factory AnimeState.loadingMore(List<AnimeModel> animeList) = _LoadingMore;
  const factory AnimeState.success(List<AnimeModel> animeList, bool hasNextPage) = _Success;
  const factory AnimeState.failure(String message) = _Failure;
}