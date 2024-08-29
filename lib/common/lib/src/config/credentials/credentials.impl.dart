part of "credentials.dart";

class _CredentialsImpl implements Credentials {
  _CredentialsImpl(this.cookieJar);

  final PersistCookieJar cookieJar;

  @override
  String get apiBaseUrl => "https://api.example.com";

  @override
  String get apiBaseUrlLocal => "http://localhost:8080";

  @override
  Future<String?> get sessionId async =>
      (await cookieJar.loadForRequest(Uri.parse(apiBaseUrlLocal)))
          .firstWhereOrNull(
            (Cookie cookie) => cookie.name == "session",
          )
          ?.value;
}
