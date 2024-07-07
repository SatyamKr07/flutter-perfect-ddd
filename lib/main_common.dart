import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/presentation/core/my_app.dart';

import 'infrastructure/core/di/injection.dart';

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}
