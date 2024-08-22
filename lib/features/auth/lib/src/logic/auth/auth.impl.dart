part of "auth.dart";

class _AuthImpl extends Auth {
  const _AuthImpl(super._dio) : super._();

  @override
  Future<UserBase> register(UserAuth user) async {
    final Response<String> response = await _dio.post("/public/register", data: user.toMap());

    if (response.data == null) {
      throw MissingBodyException();
    }

    switch (response.statusCode) {
      case 200:
        return UserBase.fromJson(response.data!);
      case 403:
        throw InvalidCredentialsException();
      //TODO: ADD CASES FOR OTHER STATUS CODES
      default:
        throw ServerException();
    }
  }

  @override
  Future<UserBase> login(UserAuth user) async {
    final Response<String> response = await _dio.post("/public/login", data: user.toMap());

    if (response.data == null) {
      throw MissingBodyException();
    }

    switch (response.statusCode) {
      case 200:
        return UserBase.fromJson(response.data!);
      case 401:
        throw InvalidCredentialsException();
      //TODO: ADD CASES FOR OTHER STATUS CODES
      default:
        throw ServerException();
    }
  }
}
