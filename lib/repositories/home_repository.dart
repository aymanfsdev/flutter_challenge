import 'dart:async';

import 'package:flutter_challenge/apis/app_api.dart';

enum HomeScreenStatus { initial, loading, success, failure }

class AuthenticationRepository {
  final _controller = StreamController<HomeScreenStatus>();
  final AppApi api = AppApi();

  Stream<HomeScreenStatus> get status async* {
    yield* _controller.stream;
  }

}