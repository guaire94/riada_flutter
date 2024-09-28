// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      status:
          const UserStatusJsonConverter().fromJson(json['status'] as String),
      avatar: json['avatar'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      devices:
          (json['devices'] as List<dynamic>).map((e) => e as String).toList(),
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      lastConnection: const FirestoreTimestampJsonConverter()
          .fromJson(json['lastConnection'] as Timestamp),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'status': const UserStatusJsonConverter().toJson(instance.status),
      'avatar': instance.avatar,
      'city': instance.city,
      'country': instance.country,
      'devices': instance.devices,
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'lastConnection': const FirestoreTimestampJsonConverter()
          .toJson(instance.lastConnection),
    };
