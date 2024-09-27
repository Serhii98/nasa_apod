import 'package:flutter/material.dart';

final class AppStylesExt extends ThemeExtension<AppStylesExt> {
  const AppStylesExt({
    required this.primary,
  });

  factory AppStylesExt.build() => const AppStylesExt(
        primary: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
      );
  final TextStyle primary;

  @override
  ThemeExtension<AppStylesExt> copyWith({
    final TextStyle? primary,
  }) {
    return AppStylesExt(
      primary: primary ?? this.primary,
    );
  }

  @override
  ThemeExtension<AppStylesExt> lerp(
    covariant final ThemeExtension<AppStylesExt>? other,
    final double t,
  ) {
    if (other is! AppStylesExt) {
      return this;
    }
    return AppStylesExt(
      primary: TextStyle.lerp(primary, other.primary, t)!,
    );
  }
}
