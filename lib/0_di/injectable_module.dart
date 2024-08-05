import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_perfect_ddd/env.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: Env.baseUrl));
}