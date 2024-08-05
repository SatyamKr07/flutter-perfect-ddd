import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart';
import 'package:flutter_perfect_ddd/application/auth/auth_cubit.dart';
import 'package:flutter_perfect_ddd/application/core/services/firebase/firebase_cubit.dart';
import 'package:flutter_perfect_ddd/application/core/services/media/media_cubit.dart';
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart';
import 'package:flutter_perfect_ddd/domain/anime/i_anime_repository.dart';
import 'package:flutter_perfect_ddd/infrastructure/anime/anime_repository.dart';
import 'package:flutter_perfect_ddd/infrastructure/auth/auth_repository.dart';
import 'package:flutter_perfect_ddd/_route/my_app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import '../domain/auth/i_auth_repository.dart';
import '../env.dart';
import '../infrastructure/anime/anime_remote.dart';
import '../_core/my_enums/my_enums.dart';
import '../_core/services/firebase_service/firebase_service.dart';
import '../_core/services/media_service/media_service.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

void setupLocator() {
  ///dio
  getIt
      .registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: Env.baseUrl)));

  ///router
  getIt.registerSingleton<GoRouter>(MyAppRouter.router);

  ///auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  getIt.registerLazySingleton<IAuthRepository>(() => AuthRepository(
        firebaseAuth: getIt<FirebaseAuth>(),
        googleSignIn: getIt<GoogleSignIn>(),
      ));
  getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(getIt<IAuthRepository>()));

  ///MyApp
  getIt.registerLazySingleton<MyAppCubit>(() => MyAppCubit());

  ///anime
  getIt.registerLazySingleton<AnimeRemote>(() => AnimeRemote(getIt<Dio>()));
  getIt.registerLazySingleton<IAnimeRepository>(
      () => AnimeRepository(getIt<AnimeRemote>()));
  getIt.registerLazySingleton<AnimeCubit>(
      () => AnimeCubit(getIt<IAnimeRepository>()));

  ///Media 
   getIt.registerLazySingleton<MediaCubit>(
      () => MediaCubit(getIt<MediaService>()));

  ///firebase
  getIt.registerLazySingleton<FirebaseCubit>(
      () => FirebaseCubit(getIt<FirebaseService>()));

  ///services
  getIt.registerSingleton<MediaService>(MediaService());
  getIt.registerSingleton<FirebaseService>(FirebaseService());
  // Register other dependencies
}
