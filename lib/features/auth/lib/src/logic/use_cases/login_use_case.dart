part of "../logic.dart";

/// Single functionality class to log in user.
class LoginUseCase {
  /// Returns an instance of [LoginUseCase].
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

  /// Logs in the user and returns a [UserBase].
  Future<UserBase> call() {
    try {
      return _auth.login(UserAuth(email: _email, password: _password));
    } on Exception {
      rethrow;
    }
  }
}
