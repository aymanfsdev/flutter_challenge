import 'dart:async';

import 'package:flutter_challenge/apis/app_api.dart';
import 'package:flutter_challenge/models/album_model.dart';

enum HomeScreenStatus { initial, loading, success, failure }

class HomeScreenRepository {
  final _controller = StreamController<HomeScreenStatus>();
  final AppApi api = AppApi();

  Stream<HomeScreenStatus> get status async* {
    yield HomeScreenStatus.initial;
    yield* _controller.stream;
  }

  Future<List<Album>?> getAlbums() async {
    _controller.add(HomeScreenStatus.loading);
    var response = await api.getAlbums();
    if (response['results'] != null) {
      _controller.add(HomeScreenStatus.success);
      return (response['results'] as List).map((e) => Album.fromJson(e)).toList();
    }
    _controller.add(HomeScreenStatus.failure);
    return null;
  }
}