import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/main_common.dart';
import 'package:flutter_perfect_ddd/env.dart';
import 'infrastructure/core/my_enums/my_enums.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnumEnv.dev);
  final Map<EnumResponse, bool> loggingOptions = {
    EnumResponse.request: true,
    EnumResponse.response: true,
    EnumResponse.error: true,
  };
  mainCommon(loggingOptions: loggingOptions);
}
