/// Thrown when the API client experiences an error
/// that is not related to an HTTP response code
class ClientException implements Exception {
  String? message;

  ClientException({this.message});
}
