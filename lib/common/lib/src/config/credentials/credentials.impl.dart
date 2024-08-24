part of "credentials.dart";

class _CredentialsImpl implements Credentials {
  @override
  String get apiBaseUrl => "https://api.example.com";

  @override
  String get apiBaseUrlLocal => "http://localhost:8080";
}
