import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String price(Object price) {
    return 'AED $price';
  }

  @override
  String range_price(Object highPrice, Object lowPrice) {
    return 'AED $lowPrice to $highPrice';
  }

  @override
  String get form_price => 'Price (AED):';

  @override
  String get total => 'Total';

  @override
  String get city_placeholder_dubai => 'Dubai';

  @override
  String get city_placeholder_abu_dhabi => 'Abu Dhabi';

  @override
  String get city_placeholder_sharjah => 'Sharjah';

  @override
  String get drawer_home => 'Home';

  @override
  String get drawer_guest => 'Guest';

  @override
  String get drawer_events => 'Events';

  @override
  String get drawer_profile => 'My profile';

  @override
  String get full_name => 'Full name';

  @override
  String get city => 'City';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone';

  @override
  String get field_required_error_message => 'The field is required';

  @override
  String get size_required_error_message => 'Select at least one size';

  @override
  String get follow => 'Follow';

  @override
  String get unfollow => 'Unfollow';

  @override
  String get share => 'Share';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get add => 'Add';

  @override
  String get skip => 'Skip';

  @override
  String get change => 'Change';

  @override
  String get update => 'Update';

  @override
  String get delete => 'Delete';

  @override
  String get disable => 'Disable';

  @override
  String get logout => 'Logout';

  @override
  String get save => 'Save';

  @override
  String get select_year => 'Select year';

  @override
  String get see_all => 'See all';

  @override
  String get cancel => 'Cancel';

  @override
  String get common_error_title => 'Technical Error: Request Unable to Process';

  @override
  String get common_error_message => 'We apologize, but your request cannot be processed at this time due to a technical error. Our team has been notified of the issue and is working to resolve it as soon as possible. Please try again later or contact our support team for assistance. Thank you for your patience and understanding.';

  @override
  String get common_empty_message => 'There is no data to display';

  @override
  String get signup_title => 'Profile';

  @override
  String get signup_phone_number => 'Phone number';

  @override
  String get signup_button => 'Sign Up';

  @override
  String get inactive_account_title => 'Inactive Account';

  @override
  String get inactive_account_message => 'Your account is currently inactive. Please contact support for further assistance.';

  @override
  String get additional_profile_information_title => 'Sign Up';

  @override
  String get additional_profile_information_label_profile => 'Profile picture';

  @override
  String get additional_profile_information_label_you_are => 'You are :';

  @override
  String get delete_account => 'Delete account';

  @override
  String get delete_account_message => 'Are you sure you want to delete your account ?';

  @override
  String get login_title => 'Log In';

  @override
  String get login_error_title => 'Login Failed';

  @override
  String get login_error_message => 'We\'re sorry, but we were unable to log you in.\nThis could be because your email or password was entered incorrectly. If you\'ve forgotten your password, you can reset it by clicking the \'forgot password\' button.';

  @override
  String get login_form_email => 'Email';

  @override
  String get login_form_password => 'Password';

  @override
  String get login_form_validation_button => 'Log In';

  @override
  String login_form_forget_password(Object clickable) {
    return 'Forget password? #$clickable# to reset it';
  }

  @override
  String get login_form_forget_password_clickable => 'Click here';

  @override
  String get forget_password_title => 'Forget Password';

  @override
  String get forget_password_information_message => 'You will receive password reset instructions at the email address you\'ll enter below';

  @override
  String get forget_password_form_email => 'Email';

  @override
  String get forget_password_form_validation_button => 'Reset';

  @override
  String get forget_password_error_title => 'Reset Password failed';

  @override
  String get forget_password_error_message => 'An error occurred while send the reset link. Please try again';

  @override
  String get my_profile_title => 'Profile';

  @override
  String get my_profile_informations => 'Informations';

  @override
  String get my_profile_privacy_policy => 'Privacy Policy';

  @override
  String get my_profile_cgv => 'CGV';

  @override
  String get phone_number_verification_title => 'Sign in with phone number';

  @override
  String get phone_number_verification_verify => 'Verify';

  @override
  String get phone_number_verification_invalid_phone_number_title => 'Phone number invalid';

  @override
  String get phone_number_verification_invalid_phone_number_message => 'Make sure phone number is valid';

  @override
  String get phone_number_verification_invalid_code_title => 'Code invalid';

  @override
  String get phone_number_verification_invalid_code_message => 'Make sure that code you enter is valid';

  @override
  String get phone_number_verification_code => 'Enter sms code';

  @override
  String get coming_soon_title => 'Coming Soon';

  @override
  String get coming_soon_message => 'You will be able to use this feature soon';

  @override
  String get marketplace_title_with_no_user => 'Welcome!';

  @override
  String marketplace_title_with_user(Object user) {
    return 'Welcome back, $user!';
  }

  @override
  String get marketplace_calendar_title => 'Calendar';

  @override
  String marketplace_calendar_event_participation_title(Object sportEmoticon, Object title) {
    return '$sportEmoticon - Participation to $title';
  }

  @override
  String marketplace_calendar_event_organize_title(Object sportEmoticon, Object title) {
    return '$sportEmoticon - Organize $title';
  }

  @override
  String get marketplace_upcoming_title => 'Upcoming';

  @override
  String marketplace_event_title(Object sportEmoticon, Object title) {
    return '$sportEmoticon - $title';
  }

  @override
  String get marketplace_soccer_title => 'Football';
}
