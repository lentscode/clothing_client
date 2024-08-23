part of "router.dart";

class _AppRouterImpl implements AppRouter {
  @override
  GoRouter get router => GoRouter(
        redirect: (BuildContext context, GoRouterState state) {
          if (getIt.get<Auth>().user == null) {
            return "/auth";
          }
          return null;
        },
        initialLocation: "/auth",
        routes: <RouteBase>[
          _authRoute,
        ],
      );

  GoRoute get _authRoute => GoRoute(
        path: "/auth",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<AuthPage>(
          child: AuthPage(
            authCubit: AuthCubit(
              loginUseCase: (String email, String password) => LoginUseCase(
                email: email,
                password: password,
                auth: getIt.get<Auth>(),
              ),
              registerUseCase: (String email, String password) =>
                  RegisterUseCase(
                auth: getIt.get<Auth>(),
                email: email,
                password: password,
              ),
            ),
          ),
        ),
      );

  GoRoute get _homeRoute => GoRoute(
        path: "/",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: Scaffold()),
      );
}
