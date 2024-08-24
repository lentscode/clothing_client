library;

/// Throws when credentials for login or registration are incorrect.
class InvalidCredentialsException implements Exception {
  @override
  String toString() => "Invalid credentials";
}
