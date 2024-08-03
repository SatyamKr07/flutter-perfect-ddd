import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/infrastructure/core/my_enums/my_enums.dart';
import 'package:flutter_perfect_ddd/env.dart';
import 'infrastructure/core/di/injection.dart';
import 'presentation/my_app.dart';

void main() {
  Env.setEnvironment(EnumEnv.prod);
  setupLocator();
  runApp(MyApp());
}
