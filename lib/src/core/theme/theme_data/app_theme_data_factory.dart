import 'package:nasa_apod/src/core/theme/app_colors_ext.dart';
import 'package:nasa_apod/src/core/theme/app_styles_ext.dart';
import 'package:nasa_apod/src/core/theme/theme_data/app_theme_data.dart';

abstract class BaseThemeFactory {
  const BaseThemeFactory();

  AppThemeData build({
    required final AppColorsExt colors,
    required final AppStylesExt styles,
  });
}
