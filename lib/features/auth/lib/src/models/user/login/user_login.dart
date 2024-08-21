part "user_login.impl.dart";

abstract class UserLogin {
  const UserLogin._({
    required this.email,
    required this.password,
  });

  factory UserLogin({
    required String email,
    required String password,
  }) = _UserLoginImpl;

  final String email;
  final String password;

  Map<String, dynamic> toMap();
}