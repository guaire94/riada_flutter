import 'package:template_flutter_app/src/utils/exceptions.dart';

class UserNotLoggedException implements KlozyException {
  @override
  String get message => 'User not logged';
}
