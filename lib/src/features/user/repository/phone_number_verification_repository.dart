import 'package:injectable/injectable.dart';
import 'package:riada/src/features/user/datasource/phone_number_sign_in_data_source.dart';

@injectable
class PhoneNumberVerificationRepository {
  final PhoneNumberSignInDataSource _phoneNumberSignInDataSource;

  PhoneNumberVerificationRepository(
      {required PhoneNumberSignInDataSource phoneNumberSignInDataSource})
      : _phoneNumberSignInDataSource = phoneNumberSignInDataSource,
        super();

  Future verifyPhoneNumber(String phoneNumber) async {
    await _phoneNumberSignInDataSource.verifyPhoneNumber(phoneNumber);
  }

  Future verifySmsCode(String smsCode) async {
    await _phoneNumberSignInDataSource.verifySmsCode(smsCode);
  }
}
