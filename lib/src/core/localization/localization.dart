import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/localization/lang_model.dart';
import 'package:nasa_apod/src/core/localization/language.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';
import 'package:nasa_apod/values/l10n/gen/translation_en.dart';

class Localization {
  static const String enKey = "en";

  static List<Locale> get supportedLocales {
    final Locale enLocale = Translation.supportedLocales
        .firstWhere((final Locale element) => element.languageCode == enKey);
    return List.from(Translation.supportedLocales)
      ..removeWhere((final Locale element) => element.languageCode == enKey)
      ..insert(0, enLocale);
  }

  static String get defaultLanguageCode => supportedLocales.first.languageCode;

  static String get defaultLanguageCountryCode =>
      _getCountryCodeByLanguage(defaultLanguageCode);

  static String _getCountryCodeByLanguage(final String languageCode) {
    if (languageCode == enKey) {
      return "US";
    } else {
      throw DynamicLocalizationException("Unknown code to handle");
    }
  }

  static String _getDisplayTextByLanguage(final String languageCode) {
    if (languageCode == enKey) {
      return Language.english.displayValue;
    } else {
      throw DynamicLocalizationException("Unknown code to handle");
    }
  }

  static List<LangModel> getLangModels() {
    return supportedLocales.map((final Locale e) {
      return LangModel(
        e.languageCode,
        _getCountryCodeByLanguage(e.languageCode),
        _getDisplayTextByLanguage(e.languageCode),
      );
    }).toList();
  }

  static Translation from(final BuildContext? context) {
    if (context == null) {
      return TranslationEn();
    }
    return Translation.of(context) ?? TranslationEn();
  }

  static String languageFrom(final BuildContext? context) {
    if (context == null) {
      return supportedLocales.first.languageCode;
    }
    return Localizations.localeOf(context).languageCode;
  }

  static Translation byLang(final String? langCode) {
    return lookupTranslation(
      Translation.supportedLocales.firstWhere(
        (final Locale element) =>
            element.languageCode ==
            (langCode ?? Translation.supportedLocales.first.languageCode),
      ),
    );
  }

  static String translateDynamic(
    final BuildContext context,
    final Map<String, String> key,
  ) {
    return _getValue(context, key) ?? AppStrings.emptyString;
  }

  /// get value by key in some locale
  static String? _getValue(
    final BuildContext? context,
    final Map<String, String> key,
  ) {
    final String curKey = languageFrom(context);
    if (key.containsKey(curKey)) {
      return key[curKey] ?? AppStrings.emptyString;
    } else {
      if (kDebugMode) {
        throw DynamicLocalizationException("No supported localization");
      } else {
        return null;
      }
    }
  }
}

/// custom exception for throwing in [Localization] class
class DynamicLocalizationException implements Exception {
  /// constructor of exception
  DynamicLocalizationException(this.msg);

  final String msg;

  @override
  String toString() {
    return "DynamicLocalizationException ($msg)";
  }
}

extension LocalizationExtension on BuildContext {
  Translation tr() => Localization.from(this);
}
