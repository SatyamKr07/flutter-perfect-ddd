import 'package:flutter_perfect_ddd/_core/errors/error_handler.dart';
import 'package:fpdart/fpdart.dart';
import '../../models/anime/anime_model.dart';

abstract class IAnimeRepository {
  Future<Either<AppException, AnimeResponse>> getPopularAnime({int page = 1, int limit = 20});
}