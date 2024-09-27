import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/theme/app_colors_ext.dart';
import 'package:nasa_apod/src/core/theme/providers/theme_provider.dart';
import 'package:nasa_apod/src/core/theme/theme_data/app_theme_data.dart';

extension ThemeExtensions on BuildContext {
  AppColorsExt get colors => Theme.of(this).extension<AppColorsExt>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  Brightness get brightness => Theme.of(this).brightness;

  AppThemeData get appTheme => AppThemeProvider.of(this).current.data;
}
