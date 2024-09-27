import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/theme/app_colors_ext.dart';
import 'package:nasa_apod/src/core/theme/app_styles_ext.dart';
import 'package:nasa_apod/src/core/theme/theme_data/app_theme_data.dart';
import 'package:nasa_apod/src/core/theme/theme_data/app_theme_data_factory.dart';

final class AppThemeFactory extends BaseThemeFactory {
  const AppThemeFactory();

  @override
  AppThemeData build({
    required final AppColorsExt colors,
    required final AppStylesExt styles,
  }) {
    return AppThemeData(
      colors: colors,
      styles: styles,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colors.primary).copyWith(
          surface: colors.surface,
          onSurface: colors.onSurface,
          background: colors.background,
          onBackground: colors.onBackground,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          error: colors.error,
        ),
        elevatedButtonTheme: elevatedButtonTheme(
          colors: colors,
          styles: styles,
        ),
        inputDecorationTheme: inputDecorationTheme(
          colors: colors,
          styles: styles,
        ),
        textTheme: textTheme(
          colors: colors,
          styles: styles,
        ),
        navigationRailTheme: navigationRailThemeData(
          colors: colors,
          styles: styles,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.surface,
          foregroundColor: colors.onSurface,
          elevation: 0,
        ),
        bottomNavigationBarTheme: bottomNavigationBarTheme(
          colors: colors,
          styles: styles,
        ),
      ),
    );
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme({
    required final AppColorsExt colors,
    required final AppStylesExt styles,
  }) =>
      BottomNavigationBarThemeData(
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.iconsColor,
      );

  NavigationRailThemeData navigationRailThemeData({
    required final AppColorsExt colors,
    required final AppStylesExt styles,
  }) =>
      NavigationRailThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: colors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: colors.grey2,
        ),
        selectedLabelTextStyle: styles.primary.copyWith(
          color: colors.primary,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelTextStyle: styles.primary.copyWith(
          color: colors.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      );

  ElevatedButtonThemeData elevatedButtonTheme({
    required final AppColorsExt colors,
    required final AppStylesExt styles,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: colors.onPrimary,
          backgroundColor: colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: styles.primary.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colors.onPrimary,
          ),
          elevation: 0,
        ),
      );

  InputDecorationTheme inputDecorationTheme({
    required final AppColorsExt colors,
    required final AppStylesExt styles,
  }) =>
      InputDecorationTheme(
        fillColor: colors.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: colors.grey1.withOpacity(.15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: colors.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: colors.error,
            width: 2,
          ),
        ),
        filled: true,
        hintStyle: styles.primary.copyWith(
          color: colors.grey2,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        labelStyle: styles.primary.copyWith(
          color: colors.grey2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: colors.grey2,
          ),
        ),
      );

  PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  TextTheme textTheme({
    required final AppColorsExt colors,
    required final AppStylesExt styles,
  }) =>
      TextTheme(
        headlineLarge: styles.primary.copyWith(
          fontSize: 32,
          color: colors.onBackground,
          fontWeight: FontWeight.w700,
        ),
      );
}
