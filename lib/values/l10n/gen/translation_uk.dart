import 'translation.dart';

/// The translations for Ukrainian (`uk`).
class TranslationUk extends Translation {
  TranslationUk([String locale = 'uk']) : super(locale);

  @override
  String get unexpectedError => 'Сталася несподівана помилка, але ми вже працюємо над її виправленням. Будь ласка, зачекайте.';

  @override
  String get noInternetError => 'Відсутнє підключення до Інтернету або нестабільне з\'єднання';

  @override
  String get noPermissionError => 'Немає доступу. Перевірте свої налаштування.';

  @override
  String get enterEmailMsg => 'Введіть свою електронну адресу';

  @override
  String get enterPhoneMsg => 'Введіть свій номер телефону';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get enterCodeMsg => 'Введіть шестизначний код';

  @override
  String get noValidMsg => 'Поле не є дійсним';

  @override
  String get enterPasswordMsg => 'Введіть свій пароль';

  @override
  String get emailValidationMsg => 'Електронна адреса недійсна';

  @override
  String get phoneValidationMsg => 'Номер телефону недійсний';

  @override
  String get addMoreCharacters => 'Додайте більше символів';

  @override
  String get unableToOpen => 'Не вдалося відкрити';

  @override
  String get next => 'Далі';

  @override
  String get skip => 'Пропустити';

  @override
  String get select => 'Виберіть';

  @override
  String get symbols => 'символи';

  @override
  String get phoneCopiedMsg => 'Номер телефону скопійовано в буфер обміну';

  @override
  String get backToMain => 'Повернутися на головну';

  @override
  String get retry => 'Спробувати знову';

  @override
  String get signInBtnTxt => 'Увійти';

  @override
  String get signUpBtnTxt => 'Зареєструватися';

  @override
  String get doNotHaveAccountQuestion => 'Не маєте акаунта?';

  @override
  String get or => 'Або';

  @override
  String get haveAccountTxt => 'У мене вже є акаунт';

  @override
  String get forgotPasswordTxt => 'Забули пароль';

  @override
  String get lostPasswordTxt => 'Я втратив пароль';

  @override
  String get toAuthBtnTxt => 'До авторизації';

  @override
  String get congratulations => 'Вітаємо';

  @override
  String get recoverPasswordTxt => 'Відновити пароль';

  @override
  String get createAccountBtnTxt => 'Створити акаунт';

  @override
  String get signUpNowTxt => 'Зареєструватися зараз';

  @override
  String get serverOverloadedMsg => 'Сервер перевантажений. Спробуйте пізніше';

  @override
  String get yes => 'Так';

  @override
  String get no => 'Ні';

  @override
  String get logOutQuestion => 'Ви впевнені, що хочете вийти?';

  @override
  String get logOut => 'Вийти';

  @override
  String get settings => 'Налаштування';

  @override
  String get myAccount => 'Мій акаунт';

  @override
  String get notifications => 'Сповіщення';

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get deleteAccount => 'Видалити акаунт';

  @override
  String get deleteAccountQuestion => 'Ви впевнені, що хочете видалити свій акаунт?';
}
