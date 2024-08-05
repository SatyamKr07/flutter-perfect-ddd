import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/_core/my_enums/my_enums.dart';
import 'package:flutter_perfect_ddd/env.dart';
import '_di/injection.dart';
import 'presentation/my_app.dart';

void main() {
  Env.setEnvironment(EnumEnv.uat);
  setupLocator();
  runApp(MyApp());
}
