part of "user_registration.dart";

class _UserRegistrationImpl extends UserRegistration {
  const _UserRegistrationImpl({
    required super.email,
    required super.password,
    required super.name,
  }) : super._();

  @override
  Map<String, dynamic> toMap() => <String, String>{
        "email": email,
        "password": password,
        "name": name,
      };
}
