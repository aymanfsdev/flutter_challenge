import 'dart:async';

import 'package:flutter_challenge/apis/app_api.dart';
import 'package:flutter_challenge/models/album_model.dart';

class HomeScreenRepository {
  final _controller = StreamController<bool>();
  final AppApi api = AppApi();

  Stream<bool> get status async* {
    yield* _controller.stream;
  }

  Future<List<Album>?> getAlbums() async {
    var response = await api.getAlbums();
    if (response['results'] != null) {
      return (response['results'] as List).map((e) => Album.fromJson(e)).toList();
    }
    return null;
  }
}