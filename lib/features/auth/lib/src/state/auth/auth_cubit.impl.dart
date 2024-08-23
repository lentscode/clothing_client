part of "auth_cubit.dart";

class _AuthCubitImpl extends AuthCubit {
  _AuthCubitImpl({
    required super.loginUseCase,
    required super.registerUseCase,
    required super.initialMode,
  }) : super._();

  //TODO: IMPROVE ERROR HANDLING
  Future<void> _login(String email, String password) async {
    try {
      emit(AuthLoading(mode: state.mode));

      final LoginUseCase useCase = loginUseCase(email, password);

      final UserBase user = await useCase.call();

      emit(AuthSuccess(mode: state.mode, user: user));
    } on Exception catch (e) {
      final (String? emailError, String? passwordError) = _parseException(e);
      emit(AuthError(
          mode: state.mode,
          emailError: emailError,
          passwordError: passwordError));
    }
  }

  Future<void> _register(String email, String password) async {
    try {
      emit(AuthLoading(mode: state.mode));

      final RegisterUseCase useCase = registerUseCase(email, password);

      final UserBase user = await useCase.call();

      emit(AuthSuccess(mode: state.mode, user: user));
    } on Exception catch (e) {
      final (String? emailError, String? passwordError) = _parseException(e);
      emit(AuthError(
        mode: state.mode,
        emailError: emailError,
        passwordError: passwordError,
      ));
    }
  }

  @override
  void switchMode() {
    if (state.mode == AuthMode.login) {
      emit(const AuthInitial(mode: AuthMode.register));
    } else {
      emit(const AuthInitial(mode: AuthMode.login));
    }
  }

  @override
  Future<void> call(String email, String password) =>
      state.mode == AuthMode.login
          ? _login(email, password)
          : _register(email, password);

  (String? emailError, String? passwordError) _parseException(Exception e) {
    if (e is InvalidCredentialsException) {
      return ("Credenziali non valide", "Credenziali non valide");
    }
    return ("Errore sconosciuto", "Errore sconosciuto");
  }
}
