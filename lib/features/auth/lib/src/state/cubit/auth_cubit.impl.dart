part of "auth_cubit.dart";

class _AuthCubitImpl extends AuthCubit {
  _AuthCubitImpl({
    required super.loginUseCase,
    required super.registerUseCase,
  }) : super._();

  //TODO: IMPROVE ERROR HANDLING

  Future<void> _login(String email, String password) async {
    try {
      emit(AuthLoading(mode: state.mode));

      final LoginUseCase useCase = loginUseCase(email, password);

      final UserBase user = await useCase.call();

      emit(AuthSuccess(mode: state.mode, user: user));
    } on Exception catch (e) {
      emit(AuthError(mode: state.mode, message: e.toString()));
    }
  }

  Future<void> _register(String email, String password) async {
    try {
      emit(AuthLoading(mode: state.mode));

      final RegisterUseCase useCase = registerUseCase(email, password);

      final UserBase user = await useCase.call();

      emit(AuthSuccess(mode: state.mode, user: user));
    } on Exception catch (e) {
      emit(AuthError(mode: state.mode, message: e.toString()));
    }
  }

  @override
  void switchMode() {
    if (state.mode == AuthMode.login) {
      emit(state.copyWith(mode: AuthMode.register));
    } else {
      emit(state.copyWith(mode: AuthMode.login));
    }
  }

  @override
  Future<void> call(String email, String password) =>
      state.mode == AuthMode.login ? _login(email, password) : _register(email, password);
}
