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
  Future<Either<Failure, List<AnimeModel>>> getPopularAnime() async {
    try {
      final response = await _animeRemote.getPopularAnime();
      return right(response.data);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  // @override //without retrofilt
  // Future<Either<Failure, List<AnimeModel>>>
  //     getPopularAnime() async {
  //   Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.jikan.moe/v4'));

  //   try {
  //     final response = await _dio.get('/top/anime');

  //     if (response.statusCode == 200) {
  //       final List<dynamic> animeList = response.data['data'];
  //       return right(animeList
  //           .map((animeData) => AnimeModel.fromJson(animeData))
  //           .toList());
  //     } else {
  //       return left(Failure.serverError());
  //     }
  //   } on DioException catch (e) {
  //     return left(Failure.networkError());
  //   }
  // }
}
