part of "user_auth.dart";

class _UserAuthImpl extends UserAuth {
  const _UserAuthImpl({
    required super.email,
    required super.password,
  }) : super._();

  @override
  Map<String, dynamic> toMap() => <String, String>{
        "email": email,
        "password": password,
      };
}
