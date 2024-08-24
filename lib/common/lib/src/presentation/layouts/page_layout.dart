part of "../presentation.dart";

/// A wrapper around [Scaffold] that provides a [SafeArea] for the body.
class PageLayout extends StatelessWidget {
  /// Creates a new instance of [PageLayout].
  const PageLayout({
    super.key,
    required this.body,
    this.backgroundColor,
  });

  /// The content of the page.
  final Widget body;
  /// The background color of the page.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: body,
        ),
      );
}
