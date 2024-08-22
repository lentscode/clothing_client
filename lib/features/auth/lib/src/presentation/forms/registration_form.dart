part of "../presentation.dart";

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xFFFF0099),
                          Color(0xFF493240),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Registrazione",
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
                  const SizedBox(height: 16),
                  AuthFormTextField(
                    label: const Text("Conferma Password"),
                    controller: _confirmPasswordController,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().call(_emailController.text, _passwordController.text);
                  }
                },
                child: const Text("Registrati"),
              ),
            ),
          ],
        ),
      );
}
