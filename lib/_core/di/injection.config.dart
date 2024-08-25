// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_perfect_ddd/infrastructure/services/firebase_service/firebase_service.dart'
    as _i3;
import 'package:flutter_perfect_ddd/infrastructure/services/media_service/media_service.dart'
    as _i4;
import 'package:flutter_perfect_ddd/_core/di/injection.dart' as _i19;
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart' as _i18;
import 'package:flutter_perfect_ddd/application/auth/auth_cubit.dart' as _i15;
import 'package:flutter_perfect_ddd/application/firebase/firebase_cubit.dart'
    as _i14;
import 'package:flutter_perfect_ddd/application/media/media_cubit.dart'
    as _i12;
import 'package:flutter_perfect_ddd/application/fly_with_flutter/fly_with_flutter_cubit.dart'
    as _i13;
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart'
    as _i5;
import 'package:flutter_perfect_ddd/domain/repositories/anime/anime_repository.dart'
    as _i16;
import 'package:flutter_perfect_ddd/domain/repositories/auth/auth_repository.dart'
    as _i9;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_remote.dart'
    as _i11;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_repository_impl.dart'
    as _i17;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/auth/auth_repository_impl.dart'
    as _i10;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/fly_with_flutter/tutorial_repository.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.FirebaseService>(() => _i3.FirebaseService());
    gh.lazySingleton<_i4.MediaService>(() => _i4.MediaService());
    gh.lazySingleton<_i5.MyAppCubit>(() => _i5.MyAppCubit());
    gh.lazySingleton<_i6.TutorialRepository>(() => _i6.TutorialRepository());
    gh.lazySingleton<_i7.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i8.GoRouter>(() => registerModule.router);
    gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl());
    gh.lazySingleton<_i11.AnimeRemote>(() => _i11.AnimeRemote(gh<_i7.Dio>()));
    gh.lazySingleton<_i12.MediaCubit>(
        () => _i12.MediaCubit(gh<_i4.MediaService>()));
    gh.lazySingleton<_i13.FlyWithFlutterCubit>(
        () => _i13.FlyWithFlutterCubit(gh<_i6.TutorialRepository>()));
    gh.lazySingleton<_i14.FirebaseCubit>(
        () => _i14.FirebaseCubit(gh<_i3.FirebaseService>()));
    gh.lazySingleton<_i15.AuthCubit>(
        () => _i15.AuthCubit(gh<_i9.AuthRepository>()));
    gh.lazySingleton<_i16.AnimeRepository>(
        () => _i17.AnimeRepositoryImpl(gh<_i11.AnimeRemote>()));
    gh.lazySingleton<_i18.AnimeCubit>(
        () => _i18.AnimeCubit(gh<_i16.AnimeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
