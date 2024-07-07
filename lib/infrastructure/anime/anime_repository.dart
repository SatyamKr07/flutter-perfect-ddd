import 'package:dio/dio.dart';
import 'package:flutter_perfect_ddd/infrastructure/anime/anime_remote.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../domain/anime/i_anime_repossitory.dart';
import '../../domain/core/failures.dart';
import '../../domain/core/models/anime/anime_model.dart';

@LazySingleton(as: IAnimeRepository)
class AnimeRepository implements IAnimeRepository {
  final AnimeRemote _animeRemote;
  AnimeRepository(this._animeRemote);

  @override
  Future<Either<String, List<AnimeModel>>> getPopularAnime() async {
    try {
      final response = await _animeRemote.getPopularAnime();
      return right(response.data);
    } on DioException {
      return left("Dio Error");
    } catch (e) {
      return left(e.toString());
    }
  }

  // @override //without retrofilt
  // Future<Either<String, List<AnimeModel>>>  getPopularAnime() async {
  //   try {
  //     final response = await _animeRemote.getPopularAnime();
  //     return right(response);
  //   } catch (e) {
  //     return left(e.toString());
  //   }
  // }
}
