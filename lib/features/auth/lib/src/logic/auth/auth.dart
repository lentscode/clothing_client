import "package:dio/dio.dart";

import "../../exceptions/exceptions.dart";
import "../../models/models.dart";

part "auth.impl.dart";

/// A class that contains the logic for authentication.
abstract class Auth {
  const Auth._(this._dio);

  /// Returns an instance of [Auth].
  factory Auth(Dio dio) = _AuthImpl;

  final Dio _dio;

  /// Registers a user.
  Future<UserBase> register(UserAuth user);

  /// Logs in a user.
  Future<UserBase> login(UserAuth user);
}
