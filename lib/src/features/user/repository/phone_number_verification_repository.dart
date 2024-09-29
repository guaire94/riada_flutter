import 'package:riada/src/features/user/datasource/exceptions/login_failed_exception.dart';
import 'package:riada/src/features/user/datasource/phone_number_sign_in_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class PhoneNumberVerificationRepository {
  final PhoneNumberSignInDataSource _phoneNumberSignInDataSource;
  String? _phoneNumber;

  PhoneNumberVerificationRepository(
      {required PhoneNumberSignInDataSource phoneNumberSignInDataSource})
      : _phoneNumberSignInDataSource = phoneNumberSignInDataSource,
        super();

  Future verifyPhoneNumber(String phoneNumber) async {
    await _phoneNumberSignInDataSource.verifyPhoneNumber(phoneNumber);
    _phoneNumber = phoneNumber;
  }

  Future verifySmsCode(String smsCode) async {
    if (_phoneNumber != null) {
      await _phoneNumberSignInDataSource.verifySmsCode(smsCode);
    } else {
      throw LoginFailedException();
    }
  }
}
