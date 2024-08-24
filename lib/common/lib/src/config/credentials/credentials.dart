part "credentials.impl.dart";

/// A class that contains the credentials and API URLs.
abstract class Credentials {
  /// Returns an instance of [Credentials].
  factory Credentials() => _CredentialsImpl();

  /// The base URL for the backend.
  String get apiBaseUrl;

  /// The base URL for the backend when running locally.
  String get apiBaseUrlLocal;
}
