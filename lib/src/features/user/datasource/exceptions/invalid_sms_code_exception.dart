import 'package:riada/src/utils/exceptions.dart';

class InvalidSmsCodeException implements KlozyException {
  @override
  String get message => 'Invalid sms code';
}
