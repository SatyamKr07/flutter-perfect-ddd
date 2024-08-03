import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/anime/i_anime_repository.dart';
import '../../domain/core/models/anime/anime_model.dart';
part 'anime_state.dart';
part 'anime_cubit.freezed.dart';

class AnimeCubit extends Cubit<AnimeState> {
  final IAnimeRepository _animeRepository;
  int _currentPage = 1;
  static const int _itemsPerPage = 5;
  List<AnimeModel> _animeList = [];
  bool _isLoading = false;

  AnimeCubit(this._animeRepository) : super(const AnimeState.initial());

  Future<void> getPopularAnime({bool loadMore = false}) async {
    if (_isLoading) return;
    _isLoading = true;

    if (!loadMore) {
      emit(const AnimeState.loading());
      _currentPage = 1;
      _animeList = [];
    } else {
      emit(AnimeState.loadingMore(_animeList));
    }

    final result = await _animeRepository.getPopularAnime(
        page: _currentPage, limit: _itemsPerPage);

    _isLoading = false;

    result.fold(
      (failure) => emit(AnimeState.failure(failure.message)),
      (data) {
        _animeList.addAll(data.data);
        _currentPage++;
        emit(AnimeState.success(_animeList, data.pagination.hasNextPage));
      },
    );
  }
}
