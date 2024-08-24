part of "../presentation.dart";

/// The form for login process.
class LoginForm extends StatefulWidget {
  /// Creates a new instance of [LoginForm].
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BlocBuilder<AuthCubit, AuthState>(
              builder: (BuildContext context, AuthState state) {
                String? emailError;
                String? passwordError;

                if (state is AuthError) {
                  emailError = state.emailError;
                  passwordError = state.passwordError;
                }

                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color(0xFF373B44),
                              Color(0xFF4286f4),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topLeft,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      AuthFormTextField(
                        label: const Text("Email"),
                        controller: _emailController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Inserisci una email";
                          }
                          return null;
                        },
                        errorText: emailError,
                      ),
                      const SizedBox(height: 16),
                      AuthFormTextField(
                        label: const Text("Password"),
                        controller: _passwordController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Inserisci una password";
                          }
                          return null;
                        },
                        errorText: passwordError,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: FilledButton(
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().call(
                          _emailController.text,
                          _passwordController.text,
                        );
                  }
                },
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (BuildContext context, AuthState state) =>
                      switch (state) {
                    AuthLoading() => const CircularProgressIndicator.adaptive(),
                    _ => const Text("Login"),
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
