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
          _homeRoute,
          _wardrobeRoute,
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

  //TODO: IMPLEMENT
  GoRoute get _homeRoute => GoRoute(
        path: "/",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage<Scaffold>(child: Scaffold()),
      );

  GoRoute get _wardrobeRoute => GoRoute(
        path: "/wardrobe",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<WardrobePage>(
          child: WardrobePage(
            clothingCubit: ClothingCubit(
              LoadClothingsOfUserUseCase(getIt.get<ClothingDataSource>()),
            )..fetch(),
          ),
        ),
        routes: <RouteBase>[
          _clothingPageRoute,
        ],
      );

  GoRoute get _clothingPageRoute => GoRoute(
        path: "clothing",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<ClothingPage>(
          child: ClothingPage(
            clothing: state.extra as Clothing,
          ),
        ),
      );
}
