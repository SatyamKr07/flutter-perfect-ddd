import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/anime/anime_cubit.dart';
import '../../application/my_app/my_app_cubit.dart';
import '../../application/my_app/my_app_state.dart';
import '../core/components/my_cached_network_image.dart';

class AnimePage extends StatelessWidget {
  const AnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime'),
        actions: [
          Switch(
            value: context.select((MyAppCubit cubit) =>
                cubit.state.themeMode == ThemeModeType.dark),
            onChanged: (value) {
              context.read<MyAppCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: BlocBuilder<AnimeCubit, AnimeState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<AnimeCubit>().getPopularAnime();
              return const Center(child: CircularProgressIndicator());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (animeList) => ListView.builder(
              shrinkWrap: true,
              itemCount: animeList.length,
              itemBuilder: (context, index) {
                final anime = animeList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      MyCachedNetworkImage(imageUrl: anime.images.jpg.imageUrl),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(anime.title),
                        subtitle: Text(anime.url),
                      ),
                      const Divider(),
                    ],
                  ),
                );
              },
            ),
            failure: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }
}
