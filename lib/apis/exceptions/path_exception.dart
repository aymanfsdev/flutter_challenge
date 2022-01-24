/// Exception thrown when an EndpointPath is incorrectly formatted
class PathException implements Exception {
  String? message;

  PathException({this.message});
}
