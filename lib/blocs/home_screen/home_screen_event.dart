part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenInitEvent extends HomeScreenEvent {}

class HomeScreenFavoriteEvent extends HomeScreenEvent {
  const HomeScreenFavoriteEvent(this.artistId);

  final String artistId;

  @override
  List<Object> get props => [artistId];
}