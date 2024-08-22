part of "presentation.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.authCubit});
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => authCubit,
        child: PageLayout(
          body: Column(
            children: <Widget>[
              const Text("Auth Page"),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (BuildContext context, AuthState state) =>
                    state.mode == AuthMode.login ? Container() : const RegistrationForm(),
              )
            ],
          ),
        ),
      );
}
