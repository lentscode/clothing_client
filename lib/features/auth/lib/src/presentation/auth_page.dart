part of "presentation.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => authCubit,
        child: PageLayout(
          body: BlocBuilder<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) =>
                state.mode == AuthMode.login ? const LoginForm() : const RegistrationForm(),
          ),
        ),
      );
}
