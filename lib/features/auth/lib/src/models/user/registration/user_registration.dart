part "user_registration.impl.dart";

/// Represents a user in registration phase.
abstract class UserRegistration {
  const UserRegistration._({
    required this.email,
    required this.password,
    required this.name,
  });

  /// Returns a new instance of [UserRegistration].
  factory UserRegistration({
    required String email,
    required String password,
    required String name,
  }) = _UserRegistrationImpl;

  /// The email of the user.
  final String email;
  /// The password of the user.
  final String password;
  /// The name of the user.
  final String name;

  /// Converts this instance to a [Map].
  Map<String, dynamic> toMap();
}

