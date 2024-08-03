import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/anime/anime_cubit.dart';
import '../../application/my_app/my_app_cubit.dart';
import '../../application/my_app/my_app_state.dart';
import '../../domain/core/models/anime/anime_model.dart';
import '../core/components/my_cached_network_image.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({super.key});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
            loadingMore: (animeList) =>
                _buildAnimeList(context, animeList, true),
            success: (animeList, hasNextPage) =>
                _buildAnimeList(context, animeList, hasNextPage),
            failure: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget _buildAnimeList(
      BuildContext context, List<AnimeModel> animeList, bool hasNextPage) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<AnimeCubit>().getPopularAnime();
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: animeList.length + (hasNextPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == animeList.length && hasNextPage) {
            _loadMoreItems(context);
            return const Center(child: CircularProgressIndicator());
          }
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
    );
  }

  void _loadMoreItems(BuildContext context) {
    context.read<AnimeCubit>().getPopularAnime(loadMore: true);
  }
}
