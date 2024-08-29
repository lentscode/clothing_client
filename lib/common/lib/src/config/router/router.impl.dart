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
        initialLocation: "/",
        routes: <RouteBase>[
          _authRoute,
          _homeRoute,
          _wardrobeRoute,
        ],
      );

  GoRoute get _authRoute => GoRoute(
        path: "/auth",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage<AuthPage>(
          child: AuthPage(),
        ),
      );

  //TODO: IMPLEMENT
  GoRoute get _homeRoute => GoRoute(
        path: "/",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage<InitialPage>(
          child: InitialPage(),
        ),
      );

  GoRoute get _wardrobeRoute => GoRoute(
        path: "/wardrobe",
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<WardrobePage>(
          child: WardrobePage(
            clothingCubit: ClothingCubit(
              LoadClothesOfUserUseCase(getIt.get<ClothingDataSource>()),
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
