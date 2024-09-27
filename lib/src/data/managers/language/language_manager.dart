import 'package:nasa_apod/src/core/localization/lang_model.dart';
import 'package:nasa_apod/src/core/localization/localization.dart';
import 'package:rxdart/rxdart.dart';

final class LanguageManager {
  factory LanguageManager() {
    _instance ??= LanguageManager._internal();
    return _instance!;
  }

  LanguageManager._internal();

  static LanguageManager? _instance;

  late final PublishSubject<LangModel> onNewLanguagePropagated =
      PublishSubject<LangModel>();

  void onLanguageChanged(final LangModel lang) {
    onNewLanguagePropagated.add(lang);
  }

  LangModel getLanguageOfUser(/*UserInfo? userInfo*/) {
    return Localization.getLangModels().first;
  }
}
