// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextSizes {
  final double headLine, title, body, contentTitle, labeltitle;
  const AppTextSizes({
    this.headLine = 22,
    this.title = 18,
    this.body = 16,
    this.contentTitle = 14,
    this.labeltitle = 12,
  });
}

Color _oppositeBW(Color c) {
  return c.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}

ThemeData buildTheme({
  required Color primary,
  required Brightness brightness,
  AppTextSizes sizes = const AppTextSizes(),
  TextTheme Function(TextTheme)? googleFont,
}) {
  final base = ColorScheme.fromSeed(seedColor: primary, brightness: brightness);

  final colorScheme = base.copyWith(onSecondary: _oppositeBW(base.onSecondary));

  double sp(double v) => v.spMin;

  final basetexttheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: sp(sp(sizes.headLine)),
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: sp(sizes.headLine),
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: sp(sizes.headLine),
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: sp(sizes.title),
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: sp(sizes.title),
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontSize: sp(sizes.title),
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(fontSize: sp(sizes.body), fontWeight: FontWeight.w700),
    bodyMedium: TextStyle(
      fontSize: sp(sizes.body),
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(fontSize: sp(sizes.body), fontWeight: FontWeight.w500),
    displayLarge: TextStyle(
      fontSize: sp(sizes.contentTitle),
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: sp(sizes.contentTitle),
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontSize: sp(sizes.contentTitle),
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: sp(sizes.labeltitle),
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontSize: sp(sizes.labeltitle),
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: sp(sizes.labeltitle),
      fontWeight: FontWeight.w500,
    ),
  );

  final appliedTextTheme = (googleFont ?? GoogleFonts.poppins)(
    basetexttheme.spScaled().apply(
      displayColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
    ),
  );

  // Pick scaffold background depending on brightness
  final scaffoldBg = brightness == Brightness.dark
      ? const Color(0xFF0B1220) // dark navy
      : const Color(0xFFF7F9FC); // light gray

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    brightness: brightness,
    textTheme: appliedTextTheme,

    scaffoldBackgroundColor: scaffoldBg,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        textStyle: AppTypography(appliedTextTheme).label.semiBold,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: brightness == Brightness.dark
          ? Colors.white
          : colorScheme.onSurface,
      unselectedItemColor: brightness == Brightness.dark
          ? Colors.white70
          : colorScheme.onSurface.withValues(alpha: 0.6),
      type: BottomNavigationBarType.fixed,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      indicatorColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          color: brightness == Brightness.dark
              ? Colors.white
              : colorScheme.onSurface,
          size: 24,
        ),
      ),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          color: brightness == Brightness.dark
              ? Colors.white
              : colorScheme.onSurface,
          fontSize: 12.spMin,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: brightness == Brightness.dark
            ? Colors.white
            : colorScheme.onSurface,
      ),
      titleTextStyle: appliedTextTheme.titleMedium?.copyWith(
        color: brightness == Brightness.dark
            ? Colors.white
            : colorScheme.onSurface,
      ),
    ),

    dividerColor: colorScheme.onSurface.withValues(
      alpha: brightness == Brightness.dark ? 0.12 : 0.08,
    ),
  );
}

// ------------------- Typography helpers (unchanged) -------------------

class AppTypography {
  final TextTheme _t;
  const AppTypography(this._t);

  _Role get display => _Role(
    regular: _t.displaySmall!.copyWith(fontWeight: FontWeight.w400),
    medium: _t.displaySmall!,
    semiBold: _t.displayMedium!,
    bold: _t.displayLarge!,
  );

  _Role get headline => _Role(
    regular: _t.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
    medium: _t.headlineSmall!,
    semiBold: _t.headlineMedium!,
    bold: _t.headlineLarge!,
  );

  _Role get title => _Role(
    regular: _t.titleSmall!,
    medium: _t.titleSmall!.copyWith(fontWeight: FontWeight.w500),
    semiBold: _t.titleMedium!,
    bold: _t.titleLarge!,
  );

  _Role get body => _Role(
    regular: _t.bodyLarge!,
    medium: _t.bodyMedium!,
    semiBold: _t.bodySmall!,
    bold: _t.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
  );

  _Role get label => _Role(
    regular: _t.labelLarge!,
    medium: _t.labelMedium!,
    semiBold: _t.labelSmall!,
    bold: _t.labelLarge!.copyWith(fontWeight: FontWeight.w700),
  );
}

class _Role {
  final TextStyle regular;
  final TextStyle medium;
  final TextStyle semiBold;
  final TextStyle bold;
  const _Role({
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
  });
  _Role withColor(Color color) => _Role(
    regular: regular.copyWith(color: color),
    medium: medium.copyWith(color: color),
    semiBold: semiBold.copyWith(color: color),
    bold: bold.copyWith(color: color),
  );
}

class AppPalette {
  final ColorScheme _cs;
  const AppPalette(this._cs);
  Color get primary => _cs.primary;
  Color get onPrimary => _cs.onPrimary;
  Color get onSurface => _cs.onSurface;
  Color get onSurfaceVariant => _cs.onSurfaceVariant;
  Color get secondary => _cs.secondary;
  Color get error => _cs.error;
  Color get muted => _cs.onSurface.withValues(alpha: 0.70);
  Color get subtle => _cs.onSurface.withValues(alpha: 0.60);
  Color get disabled => _cs.onSurface.withValues(alpha: 0.38);
}

extension AppPaletteX on BuildContext {
  AppPalette get palette => AppPalette(Theme.of(this).colorScheme);
}

extension TextStyleColorX on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}

extension AppTypographyX on BuildContext {
  AppTypography get poppin => AppTypography(Theme.of(this).textTheme);
}

extension SpTextTheme on TextTheme {
  TextTheme spScaled() {
    TextStyle? s(TextStyle? t) => t == null || t.fontSize == null
        ? t
        : t.copyWith(fontSize: t.fontSize!.spMin);
    return copyWith(
      displayLarge: s(displayLarge),
      displayMedium: s(displayMedium),
      displaySmall: s(displaySmall),
      headlineLarge: s(headlineLarge),
      headlineMedium: s(headlineMedium),
      headlineSmall: s(headlineSmall),
      titleLarge: s(titleLarge),
      titleMedium: s(titleMedium),
      titleSmall: s(titleSmall),
      bodyLarge: s(bodyLarge),
      bodyMedium: s(bodyMedium),
      bodySmall: s(bodySmall),
      labelLarge: s(labelLarge),
      labelMedium: s(labelMedium),
      labelSmall: s(labelSmall),
    );
  }
}
