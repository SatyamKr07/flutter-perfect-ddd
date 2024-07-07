import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart';
import 'package:flutter_perfect_ddd/infrastructure/core/di/injection.dart';
import 'package:flutter_perfect_ddd/presentation/auth/sign_in_page.dart';
import 'package:flutter_perfect_ddd/presentation/auth/splash_page.dart';
import 'package:flutter_perfect_ddd/presentation/core/route/route_names.dart';
import 'package:flutter_perfect_ddd/presentation/my_boottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteNames.splashPage,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: RouteNames.signInPage,
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: RouteNames.myBottomNavBarPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AnimeCubit>(),
          child: const MyBottomNavBar(),
        ),
      ),
      // Add more routes here
    ],
  );
}
