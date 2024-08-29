library;

import "dart:io";

import "package:auth/auth.dart";
import "package:cookie_jar/cookie_jar.dart";
import "package:dio/dio.dart";
import "package:dio_cookie_manager/dio_cookie_manager.dart";
import "package:get_it/get_it.dart";
import "package:path_provider/path_provider.dart";
import "package:wardrobe/wardrobe.dart";

import "../../common.dart";

export "credentials/credentials.dart";
export "router/router.dart";
export "theme/theme.dart";

/// Global service locator.
final GetIt getIt = GetIt.instance;

/// Stets the cookie manager and registers services inside [getIt].
Future<void> config() async {
  final Directory cookieDirectory = await getApplicationDocumentsDirectory();

  final PersistCookieJar cookieJar = PersistCookieJar(
      storage: FileStorage("${cookieDirectory.path}/.cookies/"));

  final Credentials credentials = Credentials(cookieJar);

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: credentials.apiBaseUrlLocal,
      validateStatus: (int? status) {
        if (status == 401) {
          getIt.get<Auth>().logout();
          cookieJar.delete(Uri.parse(credentials.apiBaseUrlLocal));
          throw UnauthenticatedException();
        }
        return true;
      },
    ),
  );

  getIt.registerSingleton(cookieJar);

  final CookieManager cookieManager = CookieManager(cookieJar);

  dio.interceptors.add(cookieManager);

  getIt.registerSingleton(dio);
  getIt.registerSingleton(credentials);

  authConfig();
  wardrobeConfig();
}
