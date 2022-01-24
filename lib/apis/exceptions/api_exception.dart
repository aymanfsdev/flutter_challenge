/// Thrown when a non-200 response is received
/// from a Client request
class ApiException implements Exception {
  int? statusCode;
  String? message;
  ApiException({this.statusCode, this.message});
}
