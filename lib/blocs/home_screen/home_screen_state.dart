part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.status = false,
    this.favorites = const [],
    this.albums = const [],
  });

  final bool status;
  final List<String> favorites;
  final List<Album> albums;

  HomeScreenState copyWith({
    bool? status,
    List<String>? favorites,
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
