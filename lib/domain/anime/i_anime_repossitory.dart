import 'package:fpdart/fpdart.dart';
import '../core/failures.dart';
import '../core/models/anime/anime_model.dart';

abstract class IAnimeRepository {
  Future<Either<Failure, List<AnimeModel>>> getPopularAnime();
}
