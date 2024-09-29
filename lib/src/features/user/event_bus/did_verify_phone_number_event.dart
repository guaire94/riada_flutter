import 'package:riada/src/features/user/entity/social_user.dart';

class DidVerifyPhoneNumberEvent {
  final SocialUser user;

  DidVerifyPhoneNumberEvent(
    this.user,
  );
}
