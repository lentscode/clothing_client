library;

/// Thrown when credentials for login or registration are incorrect.
class InvalidCredentialsException implements Exception {
  @override
  String toString() => "Invalid credentials";
}

/// Thrown when a request fails because the user is unauthenticated.
class UnauthenticatedException implements Exception {
  @override
  String toString() => "Not authenticated";
}