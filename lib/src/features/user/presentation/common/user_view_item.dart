import 'package:riada/src/features/user/entity/user.dart';

class UserViewItem {
  final User user;
  final bool isClickable;

  UserViewItem({
    required this.user,
    required this.isClickable,
  });
}
