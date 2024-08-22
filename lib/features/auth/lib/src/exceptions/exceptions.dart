library;

/// Throws when the response body of a HTTP response is missing.
class MissingBodyException implements Exception {
  @override
  String toString() => "Response body is missing";
}

/// Throws when credentials for login or registration are incorrect.
class InvalidCredentialsException implements Exception {
  @override
  String toString() => "Invalid credentials";
}

/// Throws when the server returns an internal error.
class ServerException implements Exception {
  @override
  String toString() => "Server error";
}
