import 'package:riada/src/utils/exceptions.dart';

class LoginFailedException implements KlozyException {
  @override
  String get message => 'Login Failed';
}
