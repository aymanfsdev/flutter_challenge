part of 'home_screen_bloc.dart';

enum HomeScreenStatus { initial, loading, success, failure }
class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.status = HomeScreenStatus.initial,
    this.favorites = const [],
    this.albums = const [],
  });

  final HomeScreenStatus status;
  final List<num> favorites;
  final List<Album> albums;

  HomeScreenState copyWith({
    HomeScreenStatus? status,
    List<num>? favorites,
    List<Album>? albums,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
      albums: albums ?? this.albums,
    );
  }

  @override
  List<Object?> get props => [
    status,
    favorites,
    albums,
  ];
}
