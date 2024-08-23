library;

import "package:common/common.dart";
import "package:dio/dio.dart";

import "../../auth.dart";

export "credentials/auth_credentials.dart";

/// Service locator.

/// Initializes [authGetIt].
void authConfig() async {
  final Auth auth = Auth(getIt.get<Dio>());

  getIt.registerSingleton(auth);
}
