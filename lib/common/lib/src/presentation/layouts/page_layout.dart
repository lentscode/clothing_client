part of "../presentation.dart";

class PageLayout extends StatelessWidget {
  const PageLayout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: body,
        ),
      );
}
