import 'package:template_flutter_app/src/utils/exceptions.dart';

class LoginFailedException implements KlozyException {
  @override
  String get message => 'Login Failed';
}
