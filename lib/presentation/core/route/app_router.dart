import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/application/anime/anime_cubit.dart';
import 'package:flutter_perfect_ddd/infrastructure/core/di/injection.dart';
import 'package:flutter_perfect_ddd/presentation/my_boottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AnimeCubit>()..getPopularAnime(),
          child: const MyBottomNavBar(),
        ),
      ),
      // Add more routes here
    ],
  );
}
