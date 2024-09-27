import 'translation.dart';

/// The translations for English (`en`).
class TranslationEn extends Translation {
  TranslationEn([String locale = 'en']) : super(locale);

  @override
  String get unexpectedError => 'An unexpected error occurred, but we are already working to fix it. Please wait.';

  @override
  String get noInternetError => 'No internet connection or unstable connection';

  @override
  String get noPermissionError => 'No access. Check your settings.';

  @override
  String get enterEmailMsg => 'Enter your email';

  @override
  String get enterPhoneMsg => 'Enter your phone';

  @override
  String get confirm => 'Confirm';

  @override
  String get enterCodeMsg => 'Enter the six digital code';

  @override
  String get noValidMsg => 'Field is not valid';

  @override
  String get enterPasswordMsg => 'Enter your password';

  @override
  String get emailValidationMsg => 'The email address is not valid';

  @override
  String get phoneValidationMsg => 'The phone number is not valid';

  @override
  String get addMoreCharacters => 'Add more characters';

  @override
  String get unableToOpen => 'Unable to open';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get select => 'Select';

  @override
  String get symbols => 'symbols';

  @override
  String get phoneCopiedMsg => 'The phone number has been copied to the clipboard';

  @override
  String get backToMain => 'Back to main';

  @override
  String get retry => 'Retry';

  @override
  String get signInBtnTxt => 'Sign in';

  @override
  String get signUpBtnTxt => 'Sign up';

  @override
  String get doNotHaveAccountQuestion => 'Don\'t have an account?';

  @override
  String get or => 'Or';

  @override
  String get haveAccountTxt => 'I already have an account';

  @override
  String get forgotPasswordTxt => 'Forgot password';

  @override
  String get lostPasswordTxt => 'I lost my password';

  @override
  String get toAuthBtnTxt => 'To authorisation';

  @override
  String get congratulations => 'Congratulations';

  @override
  String get recoverPasswordTxt => 'Recover password';

  @override
  String get createAccountBtnTxt => 'Create account';

  @override
  String get signUpNowTxt => 'Sign up now';

  @override
  String get serverOverloadedMsg => 'The server is overloaded. Try again later';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get logOutQuestion => 'Are you sure you want to log out?';

  @override
  String get logOut => 'Log Out';

  @override
  String get settings => 'Settings';

  @override
  String get myAccount => 'My account';

  @override
  String get notifications => 'Notifications';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteAccountQuestion => 'Are you sure want to delete your account?';
}
