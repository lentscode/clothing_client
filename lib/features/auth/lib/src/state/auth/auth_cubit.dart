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

  factory AuthCubit({
    required LoginUseCase Function(String email, String password) loginUseCase,
    required RegisterUseCase Function(String email, String password) registerUseCase,
  }) = _AuthCubitImpl;

  final LoginUseCase Function(String email, String password) loginUseCase;
  final RegisterUseCase Function(String email, String password) registerUseCase;

  void switchMode();

  Future<void> call(String email, String password);
}

enum AuthMode {
  login,
  register,
}
