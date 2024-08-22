import 'package:flutter/material.dart';
import '../../_core/components/my_cached_network_image.dart';
import '../../domain/core/models/anime/anime_model.dart';

class AnimeDetailsPage extends StatelessWidget {
  final AnimeModel anime;

  const AnimeDetailsPage({Key? key, required this.anime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyCachedNetworkImage(imageUrl: anime.images.jpg.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(anime.title, style: TextStyle(fontSize: 24)),
                  Text(anime.url),
                ],
              ),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
