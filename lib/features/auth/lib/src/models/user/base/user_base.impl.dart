part of "user_base.dart";

class _UserBaseImpl extends UserBase {
  _UserBaseImpl({
    required super.id,
    required super.email,
    super.name,
  }) : super._();

  factory _UserBaseImpl.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    return _UserBaseImpl(
      id: map["_id"],
      email: map["email"],
      name: map["name"],
    );
  }
}