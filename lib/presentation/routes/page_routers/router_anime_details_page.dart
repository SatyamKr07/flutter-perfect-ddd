import 'package:go_router/go_router.dart';
import '../../../domain/models/anime/anime_model.dart';
import '../../pages/anime/anime_details_page.dart';
import '../route_names.dart';

class RouterAnimeDetailsPage {
  static final router = [
    GoRoute(
      path: RouteNames.animeDetailsPage, // Added route for anime details
      builder: (context, state) {
        final anime = state.extra
            as AnimeModel; // Ensure you're passing AnimeModel in extra
        return AnimeDetailsPage(anime: anime);
      },
    ),
    //in case we need to pass more data
    // GoRoute(
    //   path: '/anime-details',
    //   builder: (context, state) {
    //     final data = state.extra as Map<String, dynamic>;
    //     return AnimeDetailsPage(
    //       anime: data['anime'],
    //       extraInfo: data['extraInfo'],
    //     );
    //   },
    // ),
  ];
}
