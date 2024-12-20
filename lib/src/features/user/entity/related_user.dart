import 'package:json_annotation/json_annotation.dart';

part 'related_user.g.dart';

@JsonSerializable()
class RelatedUser {
  final String userId;
  final String userNickName;
  final String userAvatar;

  RelatedUser({
    required this.userId,
    required this.userNickName,
    required this.userAvatar,
  });

  factory RelatedUser.fromJson(Map<String, dynamic> json) =>
      _$RelatedUserFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedUserToJson(this);
}
