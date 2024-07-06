import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/core/models/anime/anime_model.dart';

part 'anime_remote.g.dart';

@injectable
@RestApi()
abstract class AnimeRemote {
  @factoryMethod
  factory AnimeRemote(Dio dio) = _AnimeRemote;

  @GET('/top/anime')
  Future<AnimeResponse> getPopularAnime();

}
