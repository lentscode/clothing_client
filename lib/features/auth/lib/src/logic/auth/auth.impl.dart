part of "auth.dart";

class _AuthImpl extends Auth {
  const _AuthImpl(super._dio) : super._();

  @override
  Future<UserBase> register(UserRegistration user) async {
    final Response<String> response = await _dio.post("/public/register", data: user.toMap());

    if (response.data == null) {
      throw MissingBodyException();
    }

    switch (response.statusCode) {
      case 200:
        final UserLogin userLogin = UserLogin(email: user.email, password: user.password);
        return login(userLogin);
      //TODO: ADD CASES FOR OTHER STATUS CODES
      default:
        throw ServerException();
    }
  }

  @override
  Future<UserBase> login(UserLogin user) async {
    final Response<String> response = await _dio.post("/public/login", data: user.toMap());

    if (response.data == null) {
      throw MissingBodyException();
    }

    switch (response.statusCode) {
      case 200:
        return UserBase.fromJson(response.data!);
      //TODO: ADD CASES FOR OTHER STATUS CODES
      default:
        throw ServerException();
    }
  }
}
