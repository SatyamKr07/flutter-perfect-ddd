import 'package:dio/dio.dart';
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart';
import 'package:flutter_perfect_ddd/domain/anime/i_anime_repossitory.dart';
import 'package:flutter_perfect_ddd/infrastructure/anime/anime_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../anime/anime_remote.dart';
import '../dio_interceptors/my_dio_interceptor.dart';
import '../my_enums/my_enums.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

void setupLocator({Map<ResponseEnum, bool>? loggingOptions}) {
  getIt.registerLazySingleton<Dio>(
      () => MyDioInterceptor.getDio(loggingOptions: loggingOptions));

  ///home
  getIt.registerLazySingleton<AnimeRemote>(() => AnimeRemote(getIt<Dio>()));
  getIt.registerLazySingleton<IAnimeRepository>(
      () => AnimeRepository(getIt<AnimeRemote>()));
  getIt
      .registerFactory<AnimeCubit>(() => AnimeCubit(getIt<IAnimeRepository>()));
  // Register other dependencies
}
