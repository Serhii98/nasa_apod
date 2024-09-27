import 'package:nasa_apod/src/core/theme/app_colors_ext.dart';
import 'package:nasa_apod/src/core/theme/app_styles_ext.dart';
import 'package:nasa_apod/src/core/theme/theme_data/app_theme_data.dart';
import 'package:universal_io/io.dart';

/// This is the the base theme for the app
/// It is used to generate the light and dark themes
sealed class AppTheme {
  const AppTheme();

  AppColorsExt get colors;

  AppStylesExt get styles;

  AppThemeData get data;
}

final class AppThemeSingle extends AppTheme {
  const AppThemeSingle(this.data);

  @override
  final AppThemeData data;

  @override
  AppColorsExt get colors => data.colors;

  @override
  AppStylesExt get styles => data.styles;
}

/// If you want to have different
/// themes for different platforms
final class AppThemeAdaptive extends AppTheme {
  const AppThemeAdaptive({
    required this.ios,
    required this.android,
    required this.web,
  });

  final AppThemeData ios;
  final AppThemeData android;
  final AppThemeData web;

  @override
  AppColorsExt get colors {
    if (Platform.isIOS) {
      return ios.colors;
    } else if (Platform.isAndroid) {
      return android.colors;
    } else {
      return web.colors;
    }
  }

  @override
  AppStylesExt get styles {
    if (Platform.isIOS) {
      return ios.styles;
    } else if (Platform.isAndroid) {
      return android.styles;
    } else {
      return web.styles;
    }
  }

  @override
  AppThemeData get data {
    if (Platform.isIOS) {
      return ios;
    } else if (Platform.isAndroid) {
      return android;
    } else {
      return web;
    }
  }
}
