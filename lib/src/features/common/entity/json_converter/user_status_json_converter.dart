import 'package:template_flutter_app/src/features/user/entity/user_status.dart';
import 'package:json_annotation/json_annotation.dart';

class UserStatusJsonConverter extends JsonConverter<UserStatus, String> {
  const UserStatusJsonConverter();

  @override
  UserStatus fromJson(String userStatus) {
    return UserStatus.values
        .firstWhere((element) => element.name == userStatus);
  }

  @override
  String toJson(UserStatus userStatus) {
    return userStatus.name;
  }
}
