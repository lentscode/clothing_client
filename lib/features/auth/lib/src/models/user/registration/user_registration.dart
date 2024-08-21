part "user_registration.impl.dart";

abstract class UserRegistration {
  const UserRegistration._({
    required this.email,
    required this.password,
    required this.name,
  });

  factory UserRegistration({
    required String email,
    required String password,
    required String name,
  }) = _UserRegistrationImpl;

  final String email;
  final String password;
  final String name;

  Map<String, dynamic> toMap();
}
