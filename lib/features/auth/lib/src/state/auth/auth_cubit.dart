import "package:bloc/bloc.dart";
import "package:flutter/material.dart";

import "../../../auth.dart";

part "auth_cubit.impl.dart";
part "auth_state.dart";

abstract class AuthCubit extends Cubit<AuthState> {
  AuthCubit._({
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(const AuthInitial(mode: AuthMode.register));

  /// Returns an instance of [AuthCubit].
  factory AuthCubit({
    required LoginUseCase Function(String email, String password) loginUseCase,
    required RegisterUseCase Function(String email, String password) registerUseCase,
  }) = _AuthCubitImpl;

  /// Login handler.
  final LoginUseCase Function(String email, String password) loginUseCase;

  /// Registration handler.
  final RegisterUseCase Function(String email, String password) registerUseCase;

  /// Switches between login and registration mode.
  void switchMode();

  /// Executes login or registration depending on [state.mode].
  ///
  /// At the start of login/registration, it emits [AuthLoading].
  /// Then, if the process succeeds, it emits [AuthSuccess] with user data.
  /// If an error occurs, [AuthError] is emitted.
  Future<void> call(String email, String password);
}

/// Represents the auth mode: login or registration.
enum AuthMode {
  /// Login mode.
  login,

  /// Registration mode.
  register,
}
