part of "../presentation.dart";

/// A wrapper around [Scaffold] that provides a [SafeArea] for the body.
class PageLayout extends StatelessWidget {
  /// Creates a new instance of [PageLayout].
  const PageLayout({
    super.key,
    required this.body,
    this.backgroundColor,
    this.appBar,
    this.padding = EdgeInsets.zero,
    this.top = true,
    this.bottom = true,
  });

  /// The content of the page.
  final Widget body;

  /// The background color of the page.
  final Color? backgroundColor;

  /// The AppBar to show at the top of the page.
  final PreferredSizeWidget? appBar;

  final EdgeInsets padding;

  final bool top;

  final bool bottom;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        backgroundColor: backgroundColor,
        body: SafeArea(
          top: top,
          bottom: bottom,
          minimum: padding,
          child: body,
        ),
      );
}
