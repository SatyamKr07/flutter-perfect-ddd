import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/env.dart';
import 'firebase_options.dart';
import '_di/injection.dart';
import '_core/my_enums/my_enums.dart';
import 'presentation/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.setEnvironment(EnumEnv.dev);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // setupLocator();
  configureDependencies();
  runApp(MyApp());
}
