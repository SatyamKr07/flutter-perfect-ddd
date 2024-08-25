// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart' as _i22;
import 'package:flutter_perfect_ddd/application/auth/auth_cubit.dart' as _i19;
import 'package:flutter_perfect_ddd/application/firebase/firebase_cubit.dart'
    as _i14;
import 'package:flutter_perfect_ddd/application/fly_with_flutter/fly_with_flutter_cubit.dart'
    as _i10;
import 'package:flutter_perfect_ddd/application/media/media_cubit.dart' as _i11;
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart'
    as _i3;
import 'package:flutter_perfect_ddd/domain/repositories/anime/anime_repository.dart'
    as _i20;
import 'package:flutter_perfect_ddd/domain/repositories/auth/auth_repository.dart'
    as _i12;
import 'package:flutter_perfect_ddd/domain/repositories/user/user_repository.dart'
    as _i17;
import 'package:flutter_perfect_ddd/infrastructure/datasources/firebase/firebase_user_datasource.dart'
    as _i16;
import 'package:flutter_perfect_ddd/infrastructure/di/injection.dart' as _i23;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_remote.dart'
    as _i15;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_repository_impl.dart'
    as _i21;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/auth/auth_repository_impl.dart'
    as _i13;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/fly_with_flutter/tutorial_repository.dart'
    as _i7;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/user/user_repository_impl.dart'
    as _i18;
import 'package:flutter_perfect_ddd/infrastructure/services/firebase_service/firebase_service.dart'
    as _i8;
import 'package:flutter_perfect_ddd/infrastructure/services/media_service/media_service.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i5;
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
    gh.lazySingleton<_i3.MyAppCubit>(() => _i3.MyAppCubit());
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i5.GoRouter>(() => registerModule.router);
    gh.lazySingleton<_i6.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i7.TutorialRepository>(() => _i7.TutorialRepository());
    gh.lazySingleton<_i8.FirebaseService>(() => _i8.FirebaseService());
    gh.lazySingleton<_i9.MediaService>(() => _i9.MediaService());
    gh.lazySingleton<_i10.FlyWithFlutterCubit>(
        () => _i10.FlyWithFlutterCubit(gh<_i7.TutorialRepository>()));
    gh.lazySingleton<_i11.MediaCubit>(
        () => _i11.MediaCubit(gh<_i9.MediaService>()));
    gh.lazySingleton<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl());
    gh.lazySingleton<_i14.FirebaseCubit>(
        () => _i14.FirebaseCubit(gh<_i8.FirebaseService>()));
    gh.lazySingleton<_i15.AnimeRemote>(() => _i15.AnimeRemote(gh<_i4.Dio>()));
    gh.lazySingleton<_i16.FirebaseUserDatasource>(
        () => _i16.FirebaseUserDatasource(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i17.UserRepository>(
        () => _i18.UserRepositoryImpl(gh<_i16.FirebaseUserDatasource>()));
    gh.lazySingleton<_i19.AuthCubit>(() => _i19.AuthCubit(
          gh<_i12.AuthRepository>(),
          gh<_i17.UserRepository>(),
        ));
    gh.lazySingleton<_i20.AnimeRepository>(
        () => _i21.AnimeRepositoryImpl(gh<_i15.AnimeRemote>()));
    gh.lazySingleton<_i22.AnimeCubit>(
        () => _i22.AnimeCubit(gh<_i20.AnimeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}
