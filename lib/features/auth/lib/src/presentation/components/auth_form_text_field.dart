part of "../presentation.dart";

class AuthFormTextField extends StatelessWidget {
  const AuthFormTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      );
}
