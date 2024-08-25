import 'package:dio/dio.dart';
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_remote.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/core/errors/app_error_handler.dart';
import '../../../domain/repositories/anime/anime_repository.dart';
import '../../../domain/core/errors/app_error.dart';
import '../../../domain/models/anime/anime_model.dart';

@LazySingleton(as: AnimeRepository)
class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemote _animeRemote;
  AnimeRepositoryImpl(this._animeRemote);

  @override
  Future<Either<AppError, AnimeResponse>> getPopularAnime(
      {int page = 1, int limit = 5}) async {
    try {
      final response =
          await _animeRemote.getPopularAnime(page: page, limit: limit);
      return right(response);
    } on DioException catch (e) {
      return left(AppErrorHandler.handleDioError(e));
    } catch (e) {
      return left(AppErrorHandler.handleUnknownError(e.toString()));
    }
  }
}
