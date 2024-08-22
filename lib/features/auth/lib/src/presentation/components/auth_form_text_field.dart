part of "../presentation.dart";

class AuthFormTextField extends StatelessWidget {
  const AuthFormTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.errorText,
  });

  final TextEditingController controller;
  final Text label;
  final String? Function(String? value)? validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) => TextFormField(
        textCapitalization: TextCapitalization.none,
        controller: controller,
        cursorColor: Colors.grey,
        validator: validator,
        autocorrect: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          errorText: errorText,
          label: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: WidgetStateTextStyle.resolveWith(
            (Set<WidgetState> e) {
              if (e.contains(WidgetState.error)) {
                return const TextStyle(color: Colors.red);
              } else if (e.contains(WidgetState.focused)) {
                return const TextStyle(color: Colors.blue);
              } else {
                return const TextStyle(color: Colors.grey);
              }
            },
          ),
        ),
      );
}
