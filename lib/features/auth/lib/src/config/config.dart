library;

import "package:common/common.dart";
import "package:dio/dio.dart";

import "../../auth.dart";

/// Service locator.

/// Initializes [authGetIt].
void authConfig() async {
  final Auth auth = Auth(getIt.get<Dio>());

  getIt.registerSingleton(auth);
}
