import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/anime/i_anime_repository.dart';
import '../../domain/core/models/anime/anime_model.dart';
part 'anime_state.dart';
part 'anime_cubit.freezed.dart';

class AnimeCubit extends Cubit<AnimeState> {
  final IAnimeRepository _animeRepository;

  AnimeCubit(this._animeRepository) : super(const AnimeState.initial());

  Future<void> getPopularAnime() async {
    emit(const AnimeState.loading());
    final animeList = await _animeRepository.getPopularAnime();
    animeList.fold(
      (failure) => emit(const AnimeState.failure("failed")),
      (data) => emit(AnimeState.success(data)),
    );
  }
}
