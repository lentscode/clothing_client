part of "auth_cubit.dart";

/// Base state class for [AuthCubit].
@immutable
sealed class AuthState {
  const AuthState({required this.mode});

  /// The mode of authentication: login or registration.
  final AuthMode mode;

  /// Returns a copy of [AuthState] (or subclass).
  ///
  /// It allows to change the fields.
  AuthState copyWith({AuthMode? mode});
}

/// Class that represents the initial state of the [AuthCubit].
final class AuthInitial extends AuthState {
  /// Returns an instance of [AuthState].
  const AuthInitial({required super.mode});

  @override
  AuthInitial copyWith({AuthMode? mode}) =>
      AuthInitial(mode: mode ?? this.mode);
}

/// Class emitted during a process in [AuthCubit].
final class AuthLoading extends AuthState {
  /// Returns an instance of [AuthLoading].
  const AuthLoading({required super.mode});

  @override
  AuthLoading copyWith({AuthMode? mode}) =>
      AuthLoading(mode: mode ?? this.mode);
}

/// Class emitted when login or registration finished successfully.
final class AuthSuccess extends AuthState {
  /// Returns an instance of [AuthSuccess].
  const AuthSuccess({required super.mode, required this.user});

  /// User info.
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

/// Class emitted when login or registration end with an error.
final class AuthError extends AuthState {
  /// Returns an instance of [AuthError].
  const AuthError({
    this.emailError,
    required super.mode,
    this.passwordError,
  });

  /// The error message to display on the email field.
  final String? emailError;

  /// The error message to display on the password field.
  final String? passwordError;

  @override
  AuthError copyWith({
    AuthMode? mode,
    String? emailError,
    String? passwordError,
  }) =>
      AuthError(
        mode: mode ?? this.mode,
        emailError: emailError,
        passwordError: passwordError,
      );
}
