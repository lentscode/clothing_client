part of "../logic.dart";

class LoginUseCase {
  const LoginUseCase({
    required String email,
    required String password,
    required Auth auth,
  })  : _email = email,
        _password = password,
        _auth = auth;

  final String _email;
  final String _password;
  final Auth _auth;

  Future<UserBase> call() {
    try {
      return _auth.login(UserAuth(email: _email, password: _password));
    } on Exception {
      rethrow;
    }
  }
}
