library;

import "package:dio/dio.dart";
import "package:get_it/get_it.dart";

import "../../auth.dart";
import "credentials/auth_credentials.dart";

/// Service locator.
final GetIt authGetIt = GetIt.instance;

/// Initializes [authGetIt].
Future<void> authConfig() async {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AuthCredentials().apiBaseUrlLocal,
      validateStatus: (int? status) => true,
    ),
  );

  final Auth auth = Auth(dio);

  authGetIt.registerSingleton(auth);
}
