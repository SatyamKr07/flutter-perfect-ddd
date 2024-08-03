import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
  Future<AnimeResponse> getPopularAnime({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });
}

//without retrofit, just using dio
// class AnimeRemote {
//   final Dio _dio = GetIt.instance<Dio>();

//   Future<List<AnimeModel>> getPopularAnime() async {
//     final response = await _dio.get('/top/anime');
//     final data = response.data['data'] as List;
//     return data
//         .map((item) => AnimeModel.fromJson(item as Map<String, dynamic>))
//         .toList();
//   }
// }
///NOTE: Not using try catch here as exception is handled in repository 
///for better and single point of error handling.
