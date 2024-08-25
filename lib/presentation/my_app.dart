import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../app_core/errors/app_error.dart';
import '../application/auth/auth_cubit.dart';
import '../application/my_app/my_app_cubit.dart';
import 'routes/my_app_router.dart';
import 'theme/my_app_theme.dart';
import '../infrastructure/di/injection.dart';
import '../application/my_app/my_app_state.dart';
import 'widgets/dev_error_btn.dart';
import 'routes/route_names.dart';

class MyApp extends StatelessWidget {
  final List<AppError> errors = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
        BlocProvider<MyAppCubit>(create: (context) => getIt<MyAppCubit>()),
      ],
      child: Builder(
        builder: (context) {
          getIt<AuthCubit>();
          return BlocListener<MyAppCubit, MyAppState>(
            listener: (context, state) {
              if (state.error != null) {
                errors.add(state.error!);
              }
            },
            child: MaterialApp.router(
              title: 'Flutter Perfect DDD',
              debugShowCheckedModeBanner: false,
              themeMode: context.select((MyAppCubit cubit) =>
                  cubit.state.themeMode == ThemeModeType.dark
                      ? ThemeMode.dark
                      : ThemeMode.light),
              theme: MyAppTheme.lightTheme,
              darkTheme: MyAppTheme.darkTheme,
              routerConfig: MyAppRouter.router,
              builder: (context, child) {
                return Overlay(
                  initialEntries: [
                    OverlayEntry(
                      builder: (context) => Stack(
                        children: [
                          child!,
                          BlocBuilder<MyAppCubit, MyAppState>(
                            builder: (context, state) {
                              return DevErrorButton(
                                errors: errors,
                                onTap: () {
                                  getIt<GoRouter>().push(
                                      RouteNames.errorLogPage,
                                      extra: errors);
                                  // GoRouter.of(context)
                                  //     .push(RouteNames.errorLogPage, extra: errors);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
