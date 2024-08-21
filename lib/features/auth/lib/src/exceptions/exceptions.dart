library;

/// Throws when the response body of a HTTP response is missing.
class MissingBodyException implements Exception {
  @override
  String toString() => "Response body is missing";
}

/// Throws when the server returns an internal error.
class ServerException implements Exception {
  @override
  String toString() => "Server error";
}
