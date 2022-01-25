import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/repositories/home_repository.dart';
import 'package:flutter_challenge/screens/home_screen.dart';

import 'blocs/app_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(
      MyApp(
        homeScreenRepository: HomeScreenRepository(),
      ),
    ),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.homeScreenRepository}) : super(key: key);

  final HomeScreenRepository homeScreenRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: homeScreenRepository,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}