part of "../presentation.dart";

class PageLayout extends StatelessWidget {
  const PageLayout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: body,
        ),
      );
}
