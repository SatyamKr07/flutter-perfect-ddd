// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/application/auth/auth_cubit.dart';
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart';
import 'package:flutter_perfect_ddd/presentation/core/route/my_app_router.dart';
import '../application/my_app/my_app_state.dart';
import '../infrastructure/core/di/injection.dart';
import 'core/theme/my_app_theme.dart'; // Import your theme definitions

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
        BlocProvider<MyAppCubit>(create: (context) => getIt<MyAppCubit>()),
      ],
      child: BlocBuilder<MyAppCubit, MyAppState>(
        builder: (context, appState) {
          //called getIt<AuthCubit>(); here so that initial authStateChanges in auth intial state get triggered.
          getIt<AuthCubit>();
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
