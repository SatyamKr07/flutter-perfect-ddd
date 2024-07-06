import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/presentation/core/app_widget.dart';
import 'package:flutter_perfect_ddd/env.dart';

import 'infrastructure/core/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Env.setEnvironment(EnvironmentEnum.prod);
  runApp(const AppWidget());
}
