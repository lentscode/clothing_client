part of "auth.dart";

class _AuthImpl extends Auth {
  _AuthImpl(super._dio) : super._();

  @override
  Future<UserBase> register(UserAuth user) async {
    final Response<String> response =
        await _dio.post("/register", data: user.toMap());

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
    final Response<String> response =
        await _dio.post("/login", data: user.toMap());

    if (response.data == null) {
      throw MissingBodyException();
    }

    switch (response.statusCode) {
      case 200:
        _user = UserBase.fromJson(response.data!);
        return _user!;
      case 401:
        throw InvalidCredentialsException();
      //TODO: ADD CASES FOR OTHER STATUS CODES
      default:
        throw ServerException();
    }
  }

  @override
  void logout() => _user = null;

  @override
  Future<UserBase> checkAuthentication() async {
    final Response<String> response = await _dio.get("/protected/check");

    if (response.data == null) {
      throw MissingBodyException();
    }

    switch (response.statusCode) {
      case 200:
        _user = UserBase.fromJson(response.data!);
        return _user!;
      case 401:
        throw UnauthenticatedException();
      default:
        throw ServerException();
    }
  }

  UserBase? _user;

  @override
  UserBase? get user => _user;
}
