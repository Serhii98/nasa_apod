import 'package:flutter/material.dart';

final class AppColorsExt extends ThemeExtension<AppColorsExt> {
  const AppColorsExt({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.grey1,
    required this.grey2,
    required this.iconsColor,
    required this.appleColorBackground,
    required this.appleColorIcon,
  });

  factory AppColorsExt.light() => const AppColorsExt(
        primary: Color(0xfff7b500),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xffFF5A1F),
        onSecondary: Color(0xFFFFFFFF),
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF000000),
        surface: Color(0xFFFAFAFA),
        onSurface: Color(0xFF000000),
        error: Colors.red,
        grey1: Color(0xFF616364),
        grey2: Color(0xFF7D8488),
        iconsColor: Color(0xFF263238),
        appleColorBackground: Color(0xFF000000),
        appleColorIcon: Color(0xFFFFFFFF),
      );

  // factory AppColorsExt.dark() => const AppColorsExt(
  //       primary: Color(0xfff7b500),
  //       onPrimary: Color(0xFFFFFFFF),
  //       secondary: Color(0xffFF5A1F),
  //       onSecondary: Color(0xFFFFFFFF),
  //       background: Color(0xFF0A0A0A),
  //       onBackground: Color(0xFFFAFAFA),
  //       surface: Color(0xFF161616),
  //       onSurface: Color(0xFFFFFFFF),
  //       error: Colors.red,
  //       grey1: Color(0xFF919596),
  //       grey2: Color(0xFF7D8488),
  //       iconsColor: Color(0xFFBEC1C3),
  //       appleColorBackground: Color(0xFFFFFFFF),
  //       appleColorIcon: Color(0xFF000000),
  //     );
  final Color primary;
  final Color onPrimary;

  final Color secondary;
  final Color onSecondary;

  final Color background;
  final Color onBackground;

  final Color surface;
  final Color onSurface;

  final Color grey1;
  final Color grey2;
  final Color iconsColor;
  final Color error;

  final Color appleColorBackground;
  final Color appleColorIcon;

  @override
  ThemeExtension<AppColorsExt> copyWith({
    final Color? primary,
    final Color? onPrimary,
    final Color? secondary,
    final Color? onSecondary,
    final Color? background,
    final Color? onBackground,
    final Color? surface,
    final Color? onSurface,
    final Color? error,
    final Color? grey1,
    final Color? grey2,
    final Color? iconsColor,
    final Color? appleColorBackground,
    final Color? appleColorIcon,
  }) {
    return AppColorsExt(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      iconsColor: iconsColor ?? this.iconsColor,
      appleColorBackground: appleColorBackground ?? this.appleColorBackground,
      appleColorIcon: appleColorIcon ?? this.appleColorIcon,
    );
  }

  @override
  ThemeExtension<AppColorsExt> lerp(
    covariant final ThemeExtension<AppColorsExt>? other,
    final double t,
  ) {
    if (other == null || other is! AppColorsExt) return this;

    return AppColorsExt(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      error: Color.lerp(error, other.error, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      iconsColor: Color.lerp(iconsColor, other.iconsColor, t)!,
      appleColorBackground:
          Color.lerp(appleColorBackground, other.appleColorBackground, t)!,
      appleColorIcon: Color.lerp(appleColorIcon, other.appleColorIcon, t)!,
    );
  }
}
