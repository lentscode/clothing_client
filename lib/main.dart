import "package:flutter/material.dart";

void main() {
  runApp(const MainApp());
}

/// The main application.
class MainApp extends StatelessWidget {
  /// Creates a new instance of [MainApp].
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text("Hello World!"),
          ),
        ),
      );
}
