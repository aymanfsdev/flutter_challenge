import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/blocs/home_screen/home_screen_bloc.dart';
import 'package:flutter_challenge/repositories/home_repository.dart';
import 'package:flutter_challenge/views/album_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => HomeScreenBloc(
        homeScreenRepository: RepositoryProvider.of<HomeScreenRepository>(context),
      )..add(HomeScreenInitEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jack Johnson\'s Albums'),
          actions: [
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '${state.favorites.length}',
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            return state.status == HomeScreenStatus.loading ? const Center(
              child: CircularProgressIndicator(),
            ): ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              itemBuilder: (context, index) {
                bool favorite = state.favorites.contains(state.albums[index].collectionId);
                return AlbumCardView(
                  album: state.albums[index],
                  favorite: favorite,
                  onFavorite: (num? id) {
                    context.read<HomeScreenBloc>().add(HomeScreenFavoriteEvent(state.albums[index].collectionId));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Container(height: 4,);
              },
              itemCount: state.albums.length,
            );
          },
        ),
      ),
    );
  }
}
