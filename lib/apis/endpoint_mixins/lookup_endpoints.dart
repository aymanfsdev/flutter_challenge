import '../client.dart';
import '../endpoint_path.dart';

mixin LookupEndpoints {
  final EndpointPath _authPath = EndpointPath('lookup/');

  Future<Map<String, dynamic>> getAlbums() async {
    String target = _authPath.buildPath('');

    return Client().unauthorizedRequest(ClientMethod.get, target, body: {'id': '909253', 'entity': 'album'});
  }
}
