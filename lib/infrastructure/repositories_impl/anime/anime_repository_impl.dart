import 'package:dio/dio.dart';
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_remote.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories/anime/anime_repository.dart';
import '../../../app_core/errors/app_error.dart';
import '../../../domain/models/anime/anime_model.dart';

@LazySingleton(as: AnimeRepository)
class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemote _animeRemote;
  AnimeRepositoryImpl(this._animeRemote);

  @override
  Future<Either<AppError, AnimeResponse>> getPopularAnime(
      {int page = -1, int limit = 5}) async {
    try {
      final response =
          await _animeRemote.getPopularAnime(page: -1, limit: limit);
      return right(response);
    } on DioException catch (e, stackTrace) {
      return left(AppError.dioError(e, stackTrace: stackTrace));
    } catch (e, stackTrace) {
      return left(AppError.catchError(e.toString(), stackTrace: stackTrace));
    }
  }
}
