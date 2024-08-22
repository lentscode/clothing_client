part of "../presentation.dart";

class LoginForm extends StatefulWidget {
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
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Form(
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
                ),
                const SizedBox(height: 16),
                AuthFormTextField(
                  label: const Text("Password"),
                  controller: _passwordController,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().call(
                        _emailController.text,
                        _passwordController.text,
                      );
                }
              },
              child: const Text("Login"),
            ),
          ),
        ],
      );
}
