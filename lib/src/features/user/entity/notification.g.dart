// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as String? ?? "",
      userId: json['userId'] as String,
      deeplink: json['deeplink'] as String?,
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      isChat: json['isChat'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'deeplink': instance.deeplink,
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'isChat': instance.isChat,
    };
