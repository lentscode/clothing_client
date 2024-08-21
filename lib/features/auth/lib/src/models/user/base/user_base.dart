import "dart:convert";

part "user_base.impl.dart";

abstract class UserBase {
  UserBase._({
    required this.id,
    required this.name,
    this.sessionId,
  });

  factory UserBase({
    required String id,
    required String name,
    String? sessionId,
  }) = _UserBaseImpl;

  factory UserBase.fromJson(String json) = _UserBaseImpl.fromJson;

  final String id;
  final String name;
  String? sessionId;
}
