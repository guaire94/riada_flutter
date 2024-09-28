import 'package:template_flutter_app/src/features/common/datasource/base_data_source.dart';
import 'package:template_flutter_app/src/features/user/datasource/exceptions/invalid_phone_number_exception.dart';
import 'package:template_flutter_app/src/features/user/datasource/exceptions/login_failed_exception.dart';
import 'package:template_flutter_app/src/features/user/entity/social_user.dart';
import 'package:template_flutter_app/src/features/user/event_bus/did_receive_phone_numbe_code_event.dart';
import 'package:template_flutter_app/src/features/user/event_bus/did_verify_phone_number_event.dart';
import 'package:template_flutter_app/src/utils/app_event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:injectable/injectable.dart';

@injectable
class PhoneNumberSignInDataSource extends BaseDataSource {
  late String _verificationId;
  late String _phoneNumber;

  Future verifyPhoneNumber(String phoneNumber) async {
    try {
      _phoneNumber = phoneNumber;
      await Auth.FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!
          _signIn(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            AppEventBus.instance.fire(InvalidPhoneNumberException());
          } else {
            AppEventBus.instance.fire(LoginFailedException());
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          AppEventBus.instance.fire(DidReceivePhoneNumberCodeEvent());
        },
        codeAutoRetrievalTimeout: (_) {},
      );
    } catch (_) {
      rethrow;
    }
  }

  Future verifySmsCode(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    await _signIn(credential);
  }

  Future _signIn(PhoneAuthCredential credential) async {
    final userCredential =
        await Auth.FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;
    if (user == null) throw new LoginFailedException();
    final socialUser = SocialUser(userId: user.uid, phoneNumber: _phoneNumber);
    AppEventBus.instance.fire(DidVerifyPhoneNumberEvent(socialUser));
  }
}
