import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/localization/localization.dart';
import 'package:nasa_apod/src/core/theme/app_colors_ext.dart';
import 'package:nasa_apod/src/core/theme/app_styles_ext.dart';
import 'package:nasa_apod/src/core/theme/app_theme_factory.dart';
import 'package:nasa_apod/src/core/theme/providers/theme_provider.dart';
import 'package:nasa_apod/src/core/ui/states/base_controlled_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/core_app/bloc/core_app_bloc_states.dart';
import 'package:nasa_apod/src/core_app/core_app_bloc.dart';
import 'package:nasa_apod/src/core_app/core_child.dart';
import 'package:nasa_apod/src/routing/router.dart';
import 'package:nasa_apod/src/utils/elvis.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// widget of app and its configuration
final class CoreApp extends BaseStatefulWidget {
  const CoreApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return CoreAppState();
  }
}

final class CoreAppState
    extends BaseControlledState<CoreApp, CoreAppBlocState, CoreAppBloc>
    with WidgetsBindingObserver {
  @override
  CoreAppBloc createBloc() => CoreAppBloc(context.tr());

  @override
  bool isSharedBloc() => false;

  @override
  Widget onBuild(final BuildContext context, final CoreAppBlocState state) {
    return AppThemeProvider(
      notifier: AppThemeNotifier.single(
        lightColors: AppColorsExt.light(),
        textTheme: AppStylesExt.build(),
        themeFactory: const AppThemeFactory(),
        defaultMode: ThemeMode.light,
      ),
      child: Builder(
        builder: (final BuildContext context) {
          return MaterialApp.router(
            builder: (final BuildContext context, final Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  devicePixelRatio: View.of(context).devicePixelRatio,
                  textScaler: const TextScaler.linear(1),
                ),
                child: CoreChild(child.orEmpty()),
              );
            },
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter().config(
              navigatorObservers: () => <NavigatorObserver>[
                if (kDebugMode) InfoRoutesObserver(),
                SentryNavigatorObserver(),
              ],
            ),
            localizationsDelegates: const <LocalizationsDelegate>[
              Translation.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale:
                Locale(state.data?.langModel.langCode ?? Localization.enKey),
            supportedLocales: Localization.supportedLocales,
            localeResolutionCallback: (
              final Locale? locale,
              final Iterable<Locale> supportedLocales,
            ) {
              for (final Locale supportedLocaleLanguage in supportedLocales) {
                if (supportedLocaleLanguage.languageCode ==
                    locale?.languageCode) {
                  return supportedLocaleLanguage;
                }
              }
              return supportedLocales.first;
            },
            title: AppStrings.appTitle,
            theme: AppThemeProvider.of(context).light,
            themeMode: AppThemeProvider.of(context).mode,
          );
        },
      ),
    );
  }

  @override
  void onListen(final BuildContext context, final CoreAppBlocState state) {}
}
