part of "auth_cubit.dart";

@immutable
sealed class AuthState {
  const AuthState({required this.mode});

  final AuthMode mode;

  AuthState copyWith({AuthMode? mode});
}

final class AuthInitial extends AuthState {
  const AuthInitial({required super.mode});

  @override
  AuthInitial copyWith({AuthMode? mode}) => AuthInitial(mode: mode ?? this.mode);
}

final class AuthLoading extends AuthState {
  const AuthLoading({required super.mode});

  @override
  AuthLoading copyWith({AuthMode? mode}) => AuthLoading(mode: mode ?? this.mode);
}

final class AuthSuccess extends AuthState {
  const AuthSuccess({required super.mode, required this.user});

  final UserBase user;

  @override
  AuthSuccess copyWith({
    AuthMode? mode,
    UserBase? user,
  }) =>
      AuthSuccess(
        mode: mode ?? this.mode,
        user: user ?? this.user,
      );
}

final class AuthError extends AuthState {
  const AuthError({required this.message, required super.mode});

  final String message;

  @override
  AuthError copyWith({
    AuthMode? mode,
    String? message,
  }) =>
      AuthError(
        mode: mode ?? this.mode,
        message: message ?? this.message,
      );
}
