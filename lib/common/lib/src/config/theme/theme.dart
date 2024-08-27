import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AppTheme {
  static ThemeData get light => ThemeData(
        extensions: <ThemeExtension<AppThemeExtension>>[_lightExtension],
      );

  static AppThemeExtension get _lightExtension => AppThemeExtension(
        primary: const Color(0xFF7F7CAF),
        secondary: const Color(0xFF9FB798),
        body: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 16,
        ),
        title: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        cardTitle: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        headline1: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
}

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.primary,
    required this.secondary,
    required this.body,
    required this.title,
    required this.cardTitle,
    required this.headline1,
  });

  final Color primary;
  final Color secondary;

  final TextStyle body;
  final TextStyle title;
  final TextStyle cardTitle;
  final TextStyle headline1;

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? primary,
    Color? secondary,
    TextStyle? body,
    TextStyle? title,
    TextStyle? cardTitle,
    TextStyle? headline1,
  }) =>
      AppThemeExtension(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        body: body ?? this.body,
        title: title ?? this.title,
        cardTitle: cardTitle ?? this.cardTitle,
        headline1: headline1 ?? this.headline1,
      );

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant AppThemeExtension? other,
    double t,
  ) =>
      AppThemeExtension(
        primary: Color.lerp(primary, other?.primary, t) ?? primary,
        secondary: Color.lerp(secondary, other?.secondary, t) ?? secondary,
        body: TextStyle.lerp(body, other?.body, t) ?? body,
        title: TextStyle.lerp(title, other?.title, t) ?? title,
        cardTitle: TextStyle.lerp(cardTitle, other?.cardTitle, t) ?? cardTitle,
        headline1: TextStyle.lerp(headline1, other?.headline1, t) ?? headline1,
      );
}

extension ThemeGetter on BuildContext {
  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>()!;
}
