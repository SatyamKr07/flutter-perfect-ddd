// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart';
import 'package:flutter_perfect_ddd/presentation/core/route/my_app_router.dart';
import '../../application/my_app/my_app_state.dart';
import 'theme/my_app_theme.dart'; // Import your theme definitions

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MyAppCubit>(create: (context) => MyAppCubit()),
      ],
      child: BlocBuilder<MyAppCubit, MyAppState>(
        builder: (context, appState) {
          return MaterialApp.router(
            title: 'Flutter Perfect DDD',
            debugShowCheckedModeBanner: false,
            themeMode: appState.themeMode == ThemeModeType.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: MyAppTheme.lightTheme, // Default light theme
            darkTheme: MyAppTheme.darkTheme, // Dark theme
            routerConfig: MyAppRouter.router,
          );
        },
      ),
    );
  }
}
