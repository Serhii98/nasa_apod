import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/theme/app_colors_ext.dart';
import 'package:nasa_apod/src/core/theme/app_styles_ext.dart';

final class AppThemeData {
  const AppThemeData({
    required this.colors,
    required this.styles,
    required this.theme,
  });

  final AppColorsExt colors;
  final AppStylesExt styles;
  final ThemeData theme;
}
