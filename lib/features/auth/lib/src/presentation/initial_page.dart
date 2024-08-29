part of "presentation.dart";

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    if (getIt.get<Auth>().user == null) {
      context.go("/auth");
    } else {
      context.go("/wardrobe");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PageLayout(
        backgroundColor: context.appTheme.primary,
        body: const Center(),
      );
}
