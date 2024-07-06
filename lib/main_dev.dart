import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/main_common.dart';
import 'package:flutter_perfect_ddd/env.dart';
import 'infrastructure/core/my_enums/my_enums.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnvironmentEnum.dev);
  final Map<ResponseEnum, bool> loggingOptions = {
    ResponseEnum.request: true,
    ResponseEnum.response: true,
    ResponseEnum.error: true,
  };
  mainCommon(loggingOptions: loggingOptions);
}
