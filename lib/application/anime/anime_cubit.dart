import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/_core/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/i_repositories/anime/i_anime_repository.dart';
import '../../domain/models/anime/anime_model.dart';
part 'anime_state.dart';
part 'anime_cubit.freezed.dart';

class AnimeCubit extends Cubit<AnimeState> {
  final IAnimeRepository _animeRepository;

  AnimeCubit(this._animeRepository) : super(const AnimeState());

  void initialize(ScrollController scrollController) {
    getPopularAnime();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getPopularAnime(loadMore: true);
      }
    });
  }

  Future<void> getPopularAnime({bool loadMore = false}) async {
    if (state.isLoading || !state.hasNextPage) return;

    emit(state.copyWith(isLoading: true));

    final result = await _animeRepository.getPopularAnime(
        page: state.currentPage, limit: state.itemsPerPage);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure,
        hasNextPage: false,
      )),
      (data) {
        final newAnimeList =
            loadMore ? [...state.animeList, ...data.data] : [...data.data];
        emit(state.copyWith(
          isLoading: false,
          currentPage: state.currentPage + 1,
          animeList: newAnimeList,
          hasNextPage: data.pagination.hasNextPage,
          error: null,
        ));
      },
    );
  }

  void clearErrorMessage() {
    emit(state.copyWith(error: null));
  }

  //shouldn't be used often
  void emitFromAnywhere(AnimeState newState) {
    emit(newState);
  }
}
