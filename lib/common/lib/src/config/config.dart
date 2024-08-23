library;

import "dart:io";

import "package:auth/auth.dart";
import "package:cookie_jar/cookie_jar.dart";
import "package:dio/dio.dart";
import "package:dio_cookie_manager/dio_cookie_manager.dart";
import "package:get_it/get_it.dart";
import "package:path_provider/path_provider.dart";

export "router/router.dart";

final GetIt getIt = GetIt.instance;

Future<void> config() async {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AuthCredentials().apiBaseUrlLocal,
      validateStatus: (int? status) => true,
    ),
  );

  final Directory cookieDirectory = await getApplicationCacheDirectory();

  final PersistCookieJar cookieJar =
      PersistCookieJar(storage: FileStorage(cookieDirectory.path));
  final CookieManager cookieManager = CookieManager(cookieJar);

  dio.interceptors.add(cookieManager);

  getIt.registerSingleton(dio);

  authConfig();
}
