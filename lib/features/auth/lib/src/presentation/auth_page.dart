part of "presentation.dart";

/// The authentication page.
///
/// This page allows the user to log in or register.
class AuthPage extends StatelessWidget {
  /// Creates a new instance of [AuthPage].
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
    listener: (BuildContext context, AuthState state) => switch (state) {
      AuthSuccess() => context.go("/wardrobe"),
      _ => null,
    },
    child: PageLayout(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (BuildContext context, AuthState state) =>
                  state.mode == AuthMode.login
                      ? const LoginForm()
                      : const RegistrationForm(),
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) => Text.rich(
              state.mode == AuthMode.login
                  ? _switchToRegister(context)
                  : _switchToLogin(context),
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    ),
  );

  TextSpan _switchToLogin(BuildContext context) => TextSpan(
        children: <InlineSpan>[
          const TextSpan(text: "Hai già un account? "),
          TextSpan(
            text: "Log in!",
            style: TextStyle(color: Colors.blue.shade400),
            recognizer: TapGestureRecognizer()
              ..onTap = context.read<AuthCubit>().switchMode,
          )
        ],
      );

  TextSpan _switchToRegister(BuildContext context) => TextSpan(
        children: <InlineSpan>[
          const TextSpan(text: "Non hai un account? "),
          TextSpan(
            text: "Registrati!",
            style: TextStyle(color: Colors.blue.shade400),
            recognizer: TapGestureRecognizer()
              ..onTap = context.read<AuthCubit>().switchMode,
          )
        ],
      );
}
