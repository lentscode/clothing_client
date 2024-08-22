import "dart:convert";

part "user_base.impl.dart";

/// A class that represents a user.
abstract class UserBase {
  UserBase._({
    required this.id,
    required this.email,
    this.name,
  });

  /// Returns a new instance of [UserBase].
  factory UserBase({
    required String id,
    required String email,
    String? name,
  }) = _UserBaseImpl;

  /// Returns a new instance of [UserBase] from a JSON [String].
  factory UserBase.fromJson(String json) = _UserBaseImpl.fromJson;

  /// The id of the user.
  final String id;

  final String email;

  /// The name of the user.
  String? name;
}
