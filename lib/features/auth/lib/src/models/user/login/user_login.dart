part "user_login.impl.dart";

/// A class that represents a user during login phase.
abstract class UserLogin {
  const UserLogin._({
    required this.email,
    required this.password,
  });

  /// Returns a new instance of [UserLogin].
  factory UserLogin({
    required String email,
    required String password,
  }) = _UserLoginImpl;

  /// The email of the user.
  final String email;
  /// The password of the user.
  final String password;

  /// Converts this instance to a [Map].
  Map<String, dynamic> toMap();
}