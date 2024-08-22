part of 'anime_cubit.dart';

@freezed
class AnimeState with _$AnimeState {
  const factory AnimeState({
    @Default(1) int currentPage,
    @Default(5) int itemsPerPage,
    @Default([]) List<AnimeModel> animeList,
    @Default(false) bool isLoading,
    @Default(true) bool hasNextPage,
    AppError? error,
  }) = _AnimeState;
}
