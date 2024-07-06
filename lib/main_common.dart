import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/presentation/core/app_widget.dart';

import 'infrastructure/core/di/injection.dart';
import 'infrastructure/core/my_enums/my_enums.dart';

void mainCommon({Map<ResponseEnum, bool>? loggingOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(loggingOptions: loggingOptions);
  runApp(const AppWidget());
}
