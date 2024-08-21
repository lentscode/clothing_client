part of "user_base.dart";

class _UserBaseImpl extends UserBase {
  _UserBaseImpl({
    required super.id,
    required super.name,
    super.sessionId,
  }) : super._();

  factory _UserBaseImpl.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    return _UserBaseImpl(
      id: map["_id"],
      name: map["name"],
      sessionId: map["sessionId"],
    );
  }
}