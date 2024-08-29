import "package:auth/auth.dart";
import "package:common/common.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await config();
  runApp(const MainApp());
}

/// The main application.
class MainApp extends StatelessWidget {
  /// Creates a new instance of [MainApp].
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit(
          loginUseCase: (String email, String password) => LoginUseCase(
            email: email,
            password: password,
            auth: getIt.get<Auth>(),
          ),
          registerUseCase: (String email, String password) => RegisterUseCase(
            email: email,
            password: password,
            auth: getIt.get<Auth>(),
          ),
        ),
        child: MaterialApp.router(
          theme: AppTheme.light,
          routerConfig: AppRouter().router,
        ),
      );
}
