part of "auth_credentials.dart";

class _AuthCredentialsImpl implements AuthCredentials {
  @override
  String get apiBaseUrl => "https://api.example.com";
  
  @override
  String get apiBaseUrlLocal => "http://localhost:8080";
}
