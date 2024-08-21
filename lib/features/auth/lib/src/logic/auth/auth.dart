import "package:dio/dio.dart";

import "../../exceptions/exceptions.dart";
import "../../models/models.dart";

part "auth.impl.dart";

abstract class Auth {
  const Auth._(this._dio);

  factory Auth(Dio dio) = _AuthImpl;

  final Dio _dio;

  Future<UserBase> register(UserRegistration user);

  Future<UserBase> login(UserLogin user);
}
