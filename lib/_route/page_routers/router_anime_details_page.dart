import 'package:go_router/go_router.dart';
import '../../domain/models/anime/anime_model.dart';
import '../../presentation/anime/anime_details_page.dart';
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
  ];
}
