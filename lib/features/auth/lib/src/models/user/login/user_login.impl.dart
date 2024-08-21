part of "user_login.dart";

class _UserLoginImpl extends UserLogin {
  const _UserLoginImpl({
    required super.email,
    required super.password,
  }) : super._();

  @override
  Map<String, dynamic> toMap() => <String, String>{
        "email": email,
        "password": password,
      };
}