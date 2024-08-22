import "package:common/common.dart";
import "package:flutter/material.dart";

void main() async {
  await config();
  runApp(const MainApp());
}

/// The main application.
class MainApp extends StatelessWidget {
  /// Creates a new instance of [MainApp].
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: AppRouter().router,
      );
}
