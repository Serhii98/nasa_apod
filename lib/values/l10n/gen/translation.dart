import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'translation_en.dart';
import 'translation_uk.dart';

/// Callers can lookup localized strings with an instance of Translation
/// returned by `Translation.of(context)`.
///
/// Applications need to include `Translation.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/translation.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Translation.localizationsDelegates,
///   supportedLocales: Translation.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Translation.supportedLocales
/// property.
abstract class Translation {
  Translation(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Translation? of(BuildContext context) {
    return Localizations.of<Translation>(context, Translation);
  }

  static const LocalizationsDelegate<Translation> delegate = _TranslationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk')
  ];

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred, but we are already working to fix it. Please wait.'**
  String get unexpectedError;

  /// No description provided for @noInternetError.
  ///
  /// In en, this message translates to:
  /// **'No internet connection or unstable connection'**
  String get noInternetError;

  /// No description provided for @noPermissionError.
  ///
  /// In en, this message translates to:
  /// **'No access. Check your settings.'**
  String get noPermissionError;

  /// No description provided for @enterEmailMsg.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmailMsg;

  /// No description provided for @enterPhoneMsg.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone'**
  String get enterPhoneMsg;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @enterCodeMsg.
  ///
  /// In en, this message translates to:
  /// **'Enter the six digital code'**
  String get enterCodeMsg;

  /// No description provided for @noValidMsg.
  ///
  /// In en, this message translates to:
  /// **'Field is not valid'**
  String get noValidMsg;

  /// No description provided for @enterPasswordMsg.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPasswordMsg;

  /// No description provided for @emailValidationMsg.
  ///
  /// In en, this message translates to:
  /// **'The email address is not valid'**
  String get emailValidationMsg;

  /// No description provided for @phoneValidationMsg.
  ///
  /// In en, this message translates to:
  /// **'The phone number is not valid'**
  String get phoneValidationMsg;

  /// No description provided for @addMoreCharacters.
  ///
  /// In en, this message translates to:
  /// **'Add more characters'**
  String get addMoreCharacters;

  /// No description provided for @unableToOpen.
  ///
  /// In en, this message translates to:
  /// **'Unable to open'**
  String get unableToOpen;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @symbols.
  ///
  /// In en, this message translates to:
  /// **'symbols'**
  String get symbols;

  /// No description provided for @phoneCopiedMsg.
  ///
  /// In en, this message translates to:
  /// **'The phone number has been copied to the clipboard'**
  String get phoneCopiedMsg;

  /// No description provided for @backToMain.
  ///
  /// In en, this message translates to:
  /// **'Back to main'**
  String get backToMain;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @signInBtnTxt.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInBtnTxt;

  /// No description provided for @signUpBtnTxt.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpBtnTxt;

  /// No description provided for @doNotHaveAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get doNotHaveAccountQuestion;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @haveAccountTxt.
  ///
  /// In en, this message translates to:
  /// **'I already have an account'**
  String get haveAccountTxt;

  /// No description provided for @forgotPasswordTxt.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPasswordTxt;

  /// No description provided for @lostPasswordTxt.
  ///
  /// In en, this message translates to:
  /// **'I lost my password'**
  String get lostPasswordTxt;

  /// No description provided for @toAuthBtnTxt.
  ///
  /// In en, this message translates to:
  /// **'To authorisation'**
  String get toAuthBtnTxt;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @recoverPasswordTxt.
  ///
  /// In en, this message translates to:
  /// **'Recover password'**
  String get recoverPasswordTxt;

  /// No description provided for @createAccountBtnTxt.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccountBtnTxt;

  /// No description provided for @signUpNowTxt.
  ///
  /// In en, this message translates to:
  /// **'Sign up now'**
  String get signUpNowTxt;

  /// No description provided for @serverOverloadedMsg.
  ///
  /// In en, this message translates to:
  /// **'The server is overloaded. Try again later'**
  String get serverOverloadedMsg;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @logOutQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logOutQuestion;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get myAccount;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete your account?'**
  String get deleteAccountQuestion;
}

class _TranslationDelegate extends LocalizationsDelegate<Translation> {
  const _TranslationDelegate();

  @override
  Future<Translation> load(Locale locale) {
    return SynchronousFuture<Translation>(lookupTranslation(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_TranslationDelegate old) => false;
}

Translation lookupTranslation(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return TranslationEn();
    case 'uk': return TranslationUk();
  }

  throw FlutterError(
    'Translation.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
