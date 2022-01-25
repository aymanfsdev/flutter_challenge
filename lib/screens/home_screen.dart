import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/blocs/home_screen/home_screen_bloc.dart';
import 'package:flutter_challenge/repositories/home_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => HomeScreenBloc(
        homeScreenRepository: RepositoryProvider.of<HomeScreenRepository>(context),
      )..add(HomeScreenInitEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jack Johnson\'s Albums'),
        ),
        body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            return state.status ? const Center(
              child: CircularProgressIndicator(),
            ): ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  child: Text(
                    state.albums[index].artistName ?? '',
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(height: 4,);
              },
              itemCount: state.albums.length,
            );
          },
        )
      ),
    );
  }
}
