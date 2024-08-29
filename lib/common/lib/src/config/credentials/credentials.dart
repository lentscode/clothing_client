import "package:cookie_jar/cookie_jar.dart";

import "package:collection/collection.dart";

part "credentials.impl.dart";

/// A class that contains the credentials and API URLs.
abstract class Credentials {
  /// Returns an instance of [Credentials].
  factory Credentials(PersistCookieJar cookieJar) =>
      _CredentialsImpl(cookieJar);

  /// The base URL for the backend.
  String get apiBaseUrl;

  /// The base URL for the backend when running locally.
  String get apiBaseUrlLocal;

  Future<String?> get sessionId;
}
