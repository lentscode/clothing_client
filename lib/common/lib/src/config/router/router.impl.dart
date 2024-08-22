part of "router.dart";

class _AppRouterImpl implements AppRouter {
  @override
  GoRouter get router => GoRouter(
        redirect: (BuildContext context, GoRouterState state) => "/auth",
        initialLocation: "/auth",
        routes: <RouteBase>[
          _authRoute,
        ],
      );

  GoRoute get _authRoute => GoRoute(
        path: "/auth",
        pageBuilder: (BuildContext context, GoRouterState state) => MaterialPage<AuthPage>(
          child: AuthPage(
            authCubit: AuthCubit(
              loginUseCase: (String email, String password) => LoginUseCase(
                email: email,
                password: password,
                auth: authGetIt.get<Auth>(),
              ),
              registerUseCase: (String email, String password) => RegisterUseCase(
                auth: authGetIt.get<Auth>(),
                email: email,
                password: password,
              ),
            ),
          ),
        ),
      );
}
