import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../../presentation/routes/my_app_router.dart';
import '../../../env.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: Env.baseUrl));

  @lazySingleton
  GoRouter get router => MyAppRouter.router;
}

@InjectableInit(initializerName: 'init')
void configureDependencies() => getIt.init();

//if we do only use get_it package (and not with injectable package)
//we need to setup the below manually
// void setupLocator() {
//   ///dio
//   getIt
//       .registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: Env.baseUrl)));

//   ///router
//   getIt.registerSingleton<GoRouter>(MyAppRouter.router);

//   ///auth
//   getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
//   getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
//   getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
//         firebaseAuth: getIt<FirebaseAuth>(),
//         googleSignIn: getIt<GoogleSignIn>(),
//       ));
//   getIt.registerLazySingleton<AuthCubit>(
//       () => AuthCubit(getIt<AuthRepository>()));

//   ///MyApp
//   getIt.registerLazySingleton<MyAppCubit>(() => MyAppCubit());

//   ///anime
//   getIt.registerLazySingleton<AnimeRemote>(() => AnimeRemote(getIt<Dio>()));
//   getIt.registerLazySingleton<AnimeRepository>(
//       () => AnimeRepositoryImpl(getIt<AnimeRemote>()));
//   getIt.registerLazySingleton<AnimeCubit>(
//       () => AnimeCubit(getIt<AnimeRepository>()));

//   ///Media
//   getIt.registerLazySingleton<MediaCubit>(
//       () => MediaCubit(getIt<MediaService>()));

//   ///firebase
//   getIt.registerLazySingleton<FirebaseCubit>(
//       () => FirebaseCubit(getIt<FirebaseService>()));

//   ///services
//   getIt.registerSingleton<MediaService>(MediaService());
//   getIt.registerSingleton<FirebaseService>(FirebaseService());
//   // Register other dependencies
// }
