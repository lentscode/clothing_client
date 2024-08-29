library;

import "package:common/common.dart";
import "package:dio/dio.dart";

import "../../auth.dart";

/// Service locator.

/// Initializes [authGetIt].
void authConfig() {
  final Auth auth = Auth(getIt.get<Dio>())..checkAuthentication();

  getIt.registerSingleton(auth);
}
