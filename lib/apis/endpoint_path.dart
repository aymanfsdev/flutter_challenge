import './exceptions/path_exception.dart';

/// Takes a path namespace for the Sound Credit API
/// and provides a helper function to generate the
/// full endpoint URI from a relative URI.
class EndpointPath {
  /// Regular expression that matches a string containing only URL
  /// safe characters.  This pattern permits query string characters.
  final _urlSafeCharactersRegex = RegExp(r'^[\/_\-a-zA-Z0-9?=&%.]*$');

  /// [Namespace] should have no leading `/` and SHOULD have
  /// a trailing `/`.  EG: `tracksheet/send`.
  ///
  /// Throws `PathException` if the namespace is incorrectly
  /// formatted or contains unescaped characters that are not URL safe
  EndpointPath(String namespace) {
    if (namespace.startsWith('/') || !namespace.endsWith('/')) {
      throw PathException(message:
          'Namespace $namespace invalid: URI namespaces must end, but not start, with a "/" character.');
    }
    if (!_urlSafeCharactersRegex.hasMatch(namespace)) {
      throw PathException(message: 'Namespace $namespace contains characters that are not URL safe.');
    }
    _uriNamespace = namespace;
  }

  String _uriNamespace = '';

  /// Takes a relative `uri` and constructs the full
  /// namespaced endpoint URI to send to the `Client`.
  ///
  /// Throws `PathException` if the URI contains characters
  /// that are not URL safe.
  String buildPath(String uri) {
    if (uri != '' && !_urlSafeCharactersRegex.hasMatch(uri)) {
      throw PathException(message: 'URI $uri contains characters that are not URL safe');
    }
    return _uriNamespace + uri;
  }
}
