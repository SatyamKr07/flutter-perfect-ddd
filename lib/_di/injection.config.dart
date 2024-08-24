// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repositories/anime/anime_repository.dart' as _i5;
import '../infrastructure/anime/anime_remote.dart' as _i4;
import '../infrastructure/anime/anime_repository_impl.dart' as _i6;
import 'injectable_module.dart' as _i7;

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
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.Dio>(() => injectableModule.dio);
    gh.factory<_i4.AnimeRemote>(() => _i4.AnimeRemote(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.AnimeRepository>(
        () => _i6.AnimeRepositoryImpl(gh<_i4.AnimeRemote>()));
    return this;
  }
}

class _$InjectableModule extends _i7.InjectableModule {}
