part "user_auth.impl.dart";

/// A class that represents a user during login phase.
abstract class UserAuth {
  const UserAuth._({
    required this.email,
    required this.password,
  });

  /// Returns a new instance of [UserAuth].
  factory UserAuth({
    required String email,
    required String password,
  }) = _UserAuthImpl;

  /// The email of the user.
  final String email;

  /// The password of the user.
  final String password;

  /// Converts this instance to a [Map].
  Map<String, dynamic> toMap();
}
