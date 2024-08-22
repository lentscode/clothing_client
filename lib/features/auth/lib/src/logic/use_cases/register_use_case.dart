part of "../logic.dart";

class RegisterUseCase {
  RegisterUseCase({
    required Auth auth,
    required String email,
    required String password,
  })  : _auth = auth,
        _email = email,
        _password = password;

  final Auth _auth;
  final String _email;
  final String _password;

  Future<UserBase> call() {
    try {
      return _auth.register(UserAuth(email: _email, password: _password));
    } on Exception {
      rethrow;
    }
  }
}
