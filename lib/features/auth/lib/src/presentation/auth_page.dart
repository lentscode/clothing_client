part of "presentation.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) => BlocProvider<AuthCubit>(
        create: (BuildContext context) => authCubit,
        child: BlocListener<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) => switch (state) {
            AuthSuccess() => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Success!"),
                  backgroundColor: Colors.green,
                ),
              ),
            _ => null,
          },
          child: PageLayout(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (BuildContext context, AuthState state) =>
                        state.mode == AuthMode.login ? const LoginForm() : const RegistrationForm(),
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (BuildContext context, AuthState state) => Text.rich(
                    state.mode == AuthMode.login ? _switchToRegister(context) : _switchToLogin(context),
                  ),
                ),
                const SizedBox(height: 16)
              ],
            ),
          ),
        ),
      );

  TextSpan _switchToLogin(BuildContext context) => TextSpan(
        children: <InlineSpan>[
          const TextSpan(text: "Hai già un account? "),
          TextSpan(
            text: "Log in!",
            style: TextStyle(color: Colors.blue.shade400),
            recognizer: TapGestureRecognizer()..onTap = context.read<AuthCubit>().switchMode,
          )
        ],
      );

  TextSpan _switchToRegister(BuildContext context) => TextSpan(
        children: <InlineSpan>[
          const TextSpan(text: "Non hai un account? "),
          TextSpan(
            text: "Registrati!",
            style: TextStyle(color: Colors.blue.shade400),
            recognizer: TapGestureRecognizer()..onTap = context.read<AuthCubit>().switchMode,
          )
        ],
      );
}
