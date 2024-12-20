// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedUser _$RelatedUserFromJson(Map<String, dynamic> json) => RelatedUser(
      userId: json['userId'] as String,
      userNickName: json['userNickName'] as String,
      userAvatar: json['userAvatar'] as String,
    );

Map<String, dynamic> _$RelatedUserToJson(RelatedUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userNickName': instance.userNickName,
      'userAvatar': instance.userAvatar,
    };
