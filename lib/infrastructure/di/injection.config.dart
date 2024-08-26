// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i6;
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart' as _i25;
import 'package:flutter_perfect_ddd/application/auth/auth_cubit.dart' as _i20;
import 'package:flutter_perfect_ddd/application/firebase/firebase_cubit.dart'
    as _i14;
import 'package:flutter_perfect_ddd/application/fly_with_flutter/fly_with_flutter_cubit.dart'
    as _i10;
import 'package:flutter_perfect_ddd/application/media/media_cubit.dart' as _i11;
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart'
    as _i26;
import 'package:flutter_perfect_ddd/domain/repositories/anime/anime_repository.dart'
    as _i23;
import 'package:flutter_perfect_ddd/domain/repositories/auth/auth_repository.dart'
    as _i12;
import 'package:flutter_perfect_ddd/domain/repositories/error_reporting/error_reporting_repository.dart'
    as _i21;
import 'package:flutter_perfect_ddd/domain/repositories/user/user_repository.dart'
    as _i18;
import 'package:flutter_perfect_ddd/infrastructure/datasources/firebase/firebase_crashlytics_datasource.dart'
    as _i16;
import 'package:flutter_perfect_ddd/infrastructure/datasources/firebase/firebase_user_datasource.dart'
    as _i17;
import 'package:flutter_perfect_ddd/infrastructure/di/injection.dart' as _i27;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_remote.dart'
    as _i15;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/anime/anime_repository_impl.dart'
    as _i24;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/auth/auth_repository_impl.dart'
    as _i13;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/error_reporting/error_reporting_repository_impl.dart'
    as _i22;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/fly_with_flutter/tutorial_repository.dart'
    as _i7;
import 'package:flutter_perfect_ddd/infrastructure/repositories_impl/user/user_repository_impl.dart'
    as _i19;
import 'package:flutter_perfect_ddd/infrastructure/services/firebase_service/firebase_service.dart'
    as _i8;
import 'package:flutter_perfect_ddd/infrastructure/services/media_service/media_service.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i4;
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
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.GoRouter>(() => registerModule.router);
    gh.lazySingleton<_i5.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i6.FirebaseCrashlytics>(() => registerModule.crashlytics);
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
    gh.lazySingleton<_i15.AnimeRemote>(() => _i15.AnimeRemote(gh<_i3.Dio>()));
    gh.lazySingleton<_i16.FirebaseCrashlyticsDatasource>(() =>
        _i16.FirebaseCrashlyticsDatasource(gh<_i6.FirebaseCrashlytics>()));
    gh.lazySingleton<_i17.FirebaseUserDatasource>(
        () => _i17.FirebaseUserDatasource(gh<_i5.FirebaseFirestore>()));
    gh.lazySingleton<_i18.UserRepository>(
        () => _i19.UserRepositoryImpl(gh<_i17.FirebaseUserDatasource>()));
    gh.lazySingleton<_i20.AuthCubit>(() => _i20.AuthCubit(
          gh<_i12.AuthRepository>(),
          gh<_i18.UserRepository>(),
        ));
    gh.lazySingleton<_i21.ErrorReportingRepository>(() =>
        _i22.ErrorReportingRepositoryImpl(
            gh<_i16.FirebaseCrashlyticsDatasource>()));
    gh.lazySingleton<_i23.AnimeRepository>(
        () => _i24.AnimeRepositoryImpl(gh<_i15.AnimeRemote>()));
    gh.lazySingleton<_i25.AnimeCubit>(
        () => _i25.AnimeCubit(gh<_i23.AnimeRepository>()));
    gh.lazySingleton<_i26.MyAppCubit>(
        () => _i26.MyAppCubit(gh<_i21.ErrorReportingRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i27.RegisterModule {}
