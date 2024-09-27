import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/theme/app_colors_ext.dart';
import 'package:nasa_apod/src/core/theme/app_styles_ext.dart';
import 'package:nasa_apod/src/core/theme/app_theme_factory.dart';
import 'package:nasa_apod/src/core/theme/providers/app_theme.dart';

final class AppThemeProvider extends InheritedNotifier<AppThemeNotifier> {
  const AppThemeProvider({
    required super.child,
    super.key,
    super.notifier,
  });

  @override
  bool updateShouldNotify(
    covariant final InheritedNotifier<AppThemeNotifier> oldWidget,
  ) {
    final bool isModeChanged = oldWidget.notifier?.mode != notifier?.mode;
    if (isModeChanged) {
      // keeep the same theme when switching between light and dark mode while hot reloading
      notifier?.mode = oldWidget.notifier?.mode ?? ThemeMode.system;
      notifier?.setSystemBarColor();
    }
    return false;
  }

  static AppThemeNotifier of(final BuildContext context) =>
      (context
          .dependOnInheritedWidgetOfExactType<AppThemeProvider>()
          ?.notifier) ??
      (throw UnimplementedError(AppStrings.developerError));
}

final class AppThemeNotifier with ChangeNotifier {
  /// Allows you to define different themes for different platforms
  factory AppThemeNotifier.adaptive({
    required final AppStylesExt defaultTextTheme,
    required final ThemeMode mode,
    required final AppThemeFactory ios,
    required final AppThemeFactory android,
    required final AppThemeFactory web,
    final AppColorsExt? lightColors,
    final AppColorsExt? darkColors,
  }) {
    return AppThemeNotifier(
      mode: mode,
      lightTheme: lightColors != null
          ? AppThemeAdaptive(
              ios: ios.build(
                colors: lightColors,
                styles: defaultTextTheme,
              ),
              android: android.build(
                colors: lightColors,
                styles: defaultTextTheme,
              ),
              web: web.build(
                colors: lightColors,
                styles: defaultTextTheme,
              ),
            )
          : null,
      darkTheme: darkColors != null
          ? AppThemeAdaptive(
              ios: ios.build(
                colors: darkColors,
                styles: defaultTextTheme,
              ),
              android: android.build(
                colors: darkColors,
                styles: defaultTextTheme,
              ),
              web: web.build(
                colors: darkColors,
                styles: defaultTextTheme,
              ),
            )
          : null,
    );
  }

  AppThemeNotifier({
    required this.mode,
    this.lightTheme,
    this.darkTheme,
  }) {
    _init();
    setSystemBarColor();
  }

  /// Allows you to define a single theme for all platforms
  /// for both light and dark mode or just one of them
  factory AppThemeNotifier.single({
    required final AppStylesExt textTheme,
    required final AppThemeFactory themeFactory,
    required final ThemeMode defaultMode,
    final AppColorsExt? lightColors,
    final AppColorsExt? darkColors,
  }) {
    return AppThemeNotifier(
      mode: defaultMode,
      lightTheme: lightColors != null
          ? AppThemeSingle(
              themeFactory.build(
                colors: lightColors,
                styles: textTheme,
              ),
            )
          : null,
      darkTheme: darkColors != null
          ? AppThemeSingle(
              themeFactory.build(
                colors: darkColors,
                styles: textTheme,
              ),
            )
          : null,
    );
  }

  final AppTheme? lightTheme;
  final AppTheme? darkTheme;
  ThemeMode mode;

  void setMode(final ThemeMode value) {
    mode = value;
    notifyListeners();
    setSystemBarColor();
  }

  void setSystemBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            mode == ThemeMode.light ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            mode == ThemeMode.light ? Brightness.dark : Brightness.light,
        // statusBarColor: Colors.black, // color for android
        // statusBarBrightness: Brightness.light, // for ios Dark = white status
      ),
    );
  }

  ThemeData get light {
    if (lightTheme == null) {
      throw Exception('Light theme is not defined');
    }
    return lightThemeData.copyWith(
      brightness: Brightness.light,
      extensions: <ThemeExtension>[
        lightTheme!.colors,
        lightTheme!.styles,
      ],
    );
  }

  ThemeData get lightThemeData => lightTheme!.data.theme;

  AppTheme get current {
    if (mode == ThemeMode.light && lightTheme != null) {
      return lightTheme!;
    }
    throw UnimplementedError(AppStrings.developerError);
  }

  void _init() async {
    setMode(ThemeMode.light);
  }
}
