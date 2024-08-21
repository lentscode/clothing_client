import "dart:convert";

part "user_base.impl.dart";

/// A class that represents a user.
abstract class UserBase {
  UserBase._({
    required this.id,
    required this.name,
    this.sessionId,
  });

  /// Returns a new instance of [UserBase].
  factory UserBase({
    required String id,
    required String name,
    String? sessionId,
  }) = _UserBaseImpl;

  /// Returns a new instance of [UserBase] from a JSON [String].
  factory UserBase.fromJson(String json) = _UserBaseImpl.fromJson;

  /// The id of the user.
  final String id;

  /// The name of the user.
  final String name;

  /// The session id of the user.
  String? sessionId;
}
