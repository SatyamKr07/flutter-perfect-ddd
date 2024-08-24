import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../_route/route_names.dart';
import '../../application/anime/anime_cubit.dart';
import '../../application/my_app/my_app_cubit.dart';
import '../../application/my_app/my_app_state.dart';
import '../../domain/repositories/anime/anime_repository.dart';
import '../../domain/models/anime/anime_model.dart';
import '../../_di/injection.dart';
import '../../_core/components/my_cached_network_image.dart';
import '../../_core/components/my_scroll_controller_provider.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({super.key});

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnimeCubit>().initialize(_scrollController);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScrollControllerProvider(
      scrollController: _scrollController,
      child: Scaffold(
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
        body: BlocConsumer<AnimeCubit, AnimeState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "${state.error!.code!} : ${state.error!.message}")),
              );
              // Reset error message after showing
              context.read<AnimeCubit>().clearErrorMessage();
              // context
              //     .read<AnimeCubit>()
              //     .emitFromAnywhere(state.copyWith(errorMessage: null));
            }
          },
          builder: (context, state) {
            if (state.animeList.isEmpty && state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return _buildAnimeList(
                context, state.animeList, state.hasNextPage, state.isLoading);
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
      ),
    );
  }

  Widget _buildAnimeList(BuildContext context, List<AnimeModel> animeList,
      bool hasNextPage, bool isLoading) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<AnimeCubit>().getPopularAnime();
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: animeList.length + (hasNextPage || isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == animeList.length && (hasNextPage || isLoading)) {
            return const Center(child: CircularProgressIndicator());
          }
          final anime = animeList[index];
          return AnimeListItem(anime: anime);
        },
      ),
    );
  }
}

class AnimeListItem extends StatelessWidget {
  final AnimeModel anime;

  const AnimeListItem({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteNames.animeDetailsPage,
            extra: anime); // Use GoRouter for navigation
      },
      child: Padding(
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
      ),
    );
  }
}
