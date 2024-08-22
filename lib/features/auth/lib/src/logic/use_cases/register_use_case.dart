part of "../logic.dart";

/// A single-responsibility class for registering the user.
class RegisterUseCase {
  /// Returns an instance of [RegisterUseCase].
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

  /// Registers the user and returns a [UserBase] with user info.
  Future<UserBase> call() {
    try {
      return _auth.register(UserAuth(email: _email, password: _password));
    } on Exception {
      rethrow;
    }
  }
}
