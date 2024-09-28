import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
    Locale('fr')
  ];

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'AED {price}'**
  String price(Object price);

  /// No description provided for @range_price.
  ///
  /// In en, this message translates to:
  /// **'AED {lowPrice} to {highPrice}'**
  String range_price(Object highPrice, Object lowPrice);

  /// No description provided for @form_price.
  ///
  /// In en, this message translates to:
  /// **'Price (AED):'**
  String get form_price;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @drawer_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get drawer_home;

  /// No description provided for @drawer_guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get drawer_guest;

  /// No description provided for @drawer_list.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get drawer_list;

  /// No description provided for @drawer_profile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get drawer_profile;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @field_required_error_message.
  ///
  /// In en, this message translates to:
  /// **'The field is required'**
  String get field_required_error_message;

  /// No description provided for @size_required_error_message.
  ///
  /// In en, this message translates to:
  /// **'Select at least one size'**
  String get size_required_error_message;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @unfollow.
  ///
  /// In en, this message translates to:
  /// **'Unfollow'**
  String get unfollow;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

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

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @select_year.
  ///
  /// In en, this message translates to:
  /// **'Select year'**
  String get select_year;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get see_all;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @common_error_title.
  ///
  /// In en, this message translates to:
  /// **'Technical Error: Request Unable to Process'**
  String get common_error_title;

  /// No description provided for @common_error_message.
  ///
  /// In en, this message translates to:
  /// **'We apologize, but your request cannot be processed at this time due to a technical error. Our team has been notified of the issue and is working to resolve it as soon as possible. Please try again later or contact our support team for assistance. Thank you for your patience and understanding.'**
  String get common_error_message;

  /// No description provided for @signup_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get signup_title;

  /// No description provided for @signup_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get signup_phone_number;

  /// No description provided for @signup_button.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup_button;

  /// No description provided for @inactive_account_title.
  ///
  /// In en, this message translates to:
  /// **'Inactive Account'**
  String get inactive_account_title;

  /// No description provided for @inactive_account_message.
  ///
  /// In en, this message translates to:
  /// **'Your account is currently inactive. Please contact support for further assistance.'**
  String get inactive_account_message;

  /// No description provided for @additional_profile_information_title.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get additional_profile_information_title;

  /// No description provided for @additional_profile_information_label_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile picture'**
  String get additional_profile_information_label_profile;

  /// No description provided for @additional_profile_information_label_you_are.
  ///
  /// In en, this message translates to:
  /// **'You are :'**
  String get additional_profile_information_label_you_are;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get delete_account;

  /// No description provided for @delete_account_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account ?'**
  String get delete_account_message;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login_title;

  /// No description provided for @login_error_title.
  ///
  /// In en, this message translates to:
  /// **'Login Failed'**
  String get login_error_title;

  /// No description provided for @login_error_message.
  ///
  /// In en, this message translates to:
  /// **'We\'re sorry, but we were unable to log you in.\nThis could be because your email or password was entered incorrectly. If you\'ve forgotten your password, you can reset it by clicking the \'forgot password\' button.'**
  String get login_error_message;

  /// No description provided for @login_form_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get login_form_email;

  /// No description provided for @login_form_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_form_password;

  /// No description provided for @login_form_validation_button.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login_form_validation_button;

  /// No description provided for @login_form_forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget password? #{clickable}# to reset it'**
  String login_form_forget_password(Object clickable);

  /// No description provided for @login_form_forget_password_clickable.
  ///
  /// In en, this message translates to:
  /// **'Click here'**
  String get login_form_forget_password_clickable;

  /// No description provided for @forget_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_password_title;

  /// No description provided for @forget_password_information_message.
  ///
  /// In en, this message translates to:
  /// **'You will receive password reset instructions at the email address you\'ll enter below'**
  String get forget_password_information_message;

  /// No description provided for @forget_password_form_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get forget_password_form_email;

  /// No description provided for @forget_password_form_validation_button.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get forget_password_form_validation_button;

  /// No description provided for @forget_password_error_title.
  ///
  /// In en, this message translates to:
  /// **'Reset Password failed'**
  String get forget_password_error_title;

  /// No description provided for @forget_password_error_message.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while send the reset link. Please try again'**
  String get forget_password_error_message;

  /// No description provided for @my_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get my_profile_title;

  /// No description provided for @my_profile_informations.
  ///
  /// In en, this message translates to:
  /// **'Informations'**
  String get my_profile_informations;

  /// No description provided for @my_profile_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get my_profile_privacy_policy;

  /// No description provided for @my_profile_cgv.
  ///
  /// In en, this message translates to:
  /// **'CGV'**
  String get my_profile_cgv;

  /// No description provided for @phone_number_verification_title.
  ///
  /// In en, this message translates to:
  /// **'Sign in with phone number'**
  String get phone_number_verification_title;

  /// No description provided for @phone_number_verification_verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get phone_number_verification_verify;

  /// No description provided for @phone_number_verification_invalid_phone_number_title.
  ///
  /// In en, this message translates to:
  /// **'Phone number invalid'**
  String get phone_number_verification_invalid_phone_number_title;

  /// No description provided for @phone_number_verification_invalid_phone_number_message.
  ///
  /// In en, this message translates to:
  /// **'Make sure phone number is valid'**
  String get phone_number_verification_invalid_phone_number_message;

  /// No description provided for @phone_number_verification_invalid_code_title.
  ///
  /// In en, this message translates to:
  /// **'Code invalid'**
  String get phone_number_verification_invalid_code_title;

  /// No description provided for @phone_number_verification_invalid_code_message.
  ///
  /// In en, this message translates to:
  /// **'Make sure that code you enter is valid'**
  String get phone_number_verification_invalid_code_message;

  /// No description provided for @phone_number_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Enter sms code'**
  String get phone_number_verification_code;

  /// No description provided for @coming_soon_title.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get coming_soon_title;

  /// No description provided for @coming_soon_message.
  ///
  /// In en, this message translates to:
  /// **'You will be able to use this feature soon'**
  String get coming_soon_message;

  /// No description provided for @marketplace_title_with_no_user.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get marketplace_title_with_no_user;

  /// No description provided for @marketplace_title_with_user.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {user}!'**
  String marketplace_title_with_user(Object user);

  /// No description provided for @marketplace_list_section_title.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get marketplace_list_section_title;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
