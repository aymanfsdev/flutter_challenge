import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/models/album_model.dart';
import 'package:flutter_challenge/repositories/home_repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';


class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc({
    required HomeScreenRepository homeScreenRepository,
  })  : _homeScreenRepository = homeScreenRepository,
        super(const HomeScreenState()) {
    on<HomeScreenInitEvent>(_onInit);
    on<HomeScreenFavoriteEvent>(_onFavorite);
  }

  final HomeScreenRepository _homeScreenRepository;

  Future<void> _onInit(
      HomeScreenInitEvent event,
      Emitter<HomeScreenState> emit,
      ) async {
    List<Album>? albums = await _homeScreenRepository.getAlbums();
    emit(
        state.copyWith(
          albums: albums,
        )
    );
  }

  Future<void> _onFavorite(
      HomeScreenFavoriteEvent event,
      Emitter<HomeScreenState> emit,
      ) async {
    final artistId = event.artistId;

    List<String> _favorites = [];
    _favorites.addAll(state.favorites);

    if (_favorites.contains(artistId)) {
      _favorites.remove(artistId);
    } else {
      _favorites.add(artistId);
    }

    emit(
        state.copyWith(
          favorites: _favorites,
        )
    );
  }
}
