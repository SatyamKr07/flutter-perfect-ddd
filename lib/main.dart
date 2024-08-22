// import 'package:flutter/material.dart';
// import 'package:flutter_perfect_ddd/_route/route_names.dart';
// import 'package:flutter_perfect_ddd/presentation/anime/anime_details_page.dart';

// import 'domain/core/models/anime/anime_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Other properties...
//       onGenerateRoute: (RouteSettings settings) {
//         switch (settings.name) {
//           case RouteNames.animeDetailsPage:
//             final AnimeModel anime = settings.arguments as AnimeModel;
//             return MaterialPageRoute(
//               builder: (context) => AnimeDetailsPage(anime: anime),
//             );
//           // Add other routes here...
//           default:
//             return null; // Return null for unknown routes
//         }
//       },
//     );
//   }
// }