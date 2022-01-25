import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_config.dart' as config;
import 'exceptions/api_exception.dart';

enum ClientMethod { get }

/// An HTTP client that wraps http.dart packages and
/// performs default behaviours such as JSON encoding
/// of maps and the inclusion of auth headers automatically.
class Client {
  late Dio _dio;
  Client() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 15*1000,
        receiveTimeout: 15*1000
    );

    _dio = Dio(options);

  }
  /// The base URL for all API requests.
  String get baseUrl => config.apiBaseUri;

  /// Sends an HTTP request with the declared [method] to [uri]
  /// and expects a JSON-encoded response which will be
  /// decoded to a Dart `Map`.  Can include a [body]
  /// which will be JSON-encoded.
  ///
  /// Throws `ApiException` if a non-200 response is received.
  Future<Map<String, dynamic>> unauthorizedRequest(
      ClientMethod method,
      String uri,
      {Map<String, dynamic>? body}
  ) async {
    Map<String, String> headers = {};
    if (body != null) {
      headers['Content-Type'] = 'application/json';
    }
    headers['accept'] = 'application/json';

    return _sendRequest(method, uri, body, headers);
  }

  /// Sends an HTTP request with the given [method] and
  /// returns the JSON-decoded response.  Accessed by
  /// other class methods which set [headers].
  ///
  /// Throws `ApiException` if a non-200 response is received.
  Future<Map<String, dynamic>> _sendRequest(ClientMethod method, String uri,
      Map<String, dynamic>? body, Map<String, String> headers) async {
    Response response;
    switch (method) {
      case ClientMethod.get:
        String target = _composeApiTarget(uri);
        response = await _dio.get(target, queryParameters: body);
        break;
    }

    if (response.statusCode != 200 && response.statusCode != 400) {
      try {
        Map<String, dynamic> responseBody = jsonDecode(response.data);
        debugPrint('$responseBody');
        if (responseBody['response_text'] != null) {
          throw ApiException(statusCode: response.statusCode, message: responseBody['response_text'] ?? '');
        } else if (responseBody['error'] != null) {
          throw ApiException(statusCode: response.statusCode, message: responseBody['error'] ?? '');
        } else if (responseBody['message'] != null) {
          throw ApiException(statusCode: response.statusCode, message: responseBody['message'] ?? '');
        } else {
          throw ApiException(statusCode: response.statusCode, message: 'Unknown error occurred');
        }
      } catch (err, stacktrace) {
        throw ApiException(statusCode: response.statusCode, message: 'Unknown error occurred: $stacktrace');
      }
    }
    return jsonDecode(response.data);
  }

  String _composeApiTarget(String uri) {
    return baseUrl + '/' + uri;
  }
}
