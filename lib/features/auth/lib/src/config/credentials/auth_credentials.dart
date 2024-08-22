part "auth_credentials.impl.dart";

abstract class AuthCredentials {
  factory AuthCredentials() => _AuthCredentialsImpl();

  String get apiBaseUrl;

  String get apiBaseUrlLocal;
}
