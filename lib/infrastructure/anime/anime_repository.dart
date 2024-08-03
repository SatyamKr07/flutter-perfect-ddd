import 'package:dio/dio.dart';
import 'package:flutter_perfect_ddd/infrastructure/anime/anime_remote.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../domain/anime/i_anime_repository.dart';
import '../../domain/core/errors/error_handler.dart';
import '../../domain/core/models/anime/anime_model.dart';

@LazySingleton(as: IAnimeRepository)
class AnimeRepository implements IAnimeRepository {
  final AnimeRemote _animeRemote;
  AnimeRepository(this._animeRemote);

  @override
  Future<Either<AppException, AnimeResponse>> getPopularAnime(
      {int page = 1, int limit = 5}) async {
    try {
      final response =
          await _animeRemote.getPopularAnime(page: page, limit: limit);
      return right(response);
    } on DioException catch (e) {
      return left(ErrorHandler.handleDioError(e));
    } catch (e) {
      return left(ErrorHandler.handleUnknownError(e.toString()));
    }
  }
}
