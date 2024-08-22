import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart';
import 'package:flutter_perfect_ddd/_di/injection.dart';
import 'package:flutter_perfect_ddd/presentation/auth/sign_in_page.dart';
import 'package:flutter_perfect_ddd/presentation/auth/splash_page.dart';
import 'package:flutter_perfect_ddd/_route/route_names.dart';
import 'package:flutter_perfect_ddd/presentation/my_boottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:flutter_perfect_ddd/presentation/anime/anime_details_page.dart'; // Import the details page
import 'package:go_router/go_router.dart';

import '../domain/models/anime/anime_model.dart';

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
      GoRoute(
        path: RouteNames.animeDetailsPage, // Added route for anime details
        builder: (context, state) {
          final anime = state.extra
              as AnimeModel; // Ensure you're passing AnimeModel in extra
          return AnimeDetailsPage(anime: anime);
        },
      ),
      // Add more routes here
    ],
  );
}
