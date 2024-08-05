import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/0_core/my_enums/my_enums.dart';
import 'package:flutter_perfect_ddd/env.dart';
import '0_di/injection.dart';
import 'presentation/my_app.dart';

void main() {
  Env.setEnvironment(EnumEnv.uat);
  setupLocator();
  runApp(MyApp());
}
