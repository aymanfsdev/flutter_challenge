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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
