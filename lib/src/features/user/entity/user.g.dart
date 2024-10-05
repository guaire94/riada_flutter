// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      nickName: json['nickName'] as String,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
      location: _$JsonConverterFromJson<GeoPoint, GeoPoint>(
          json['location'], const GeoPointJsonConverter().fromJson),
      devices:
          (json['devices'] as List<dynamic>).map((e) => e as String).toList(),
      favoritesSports: (json['favoritesSports'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      status: _$JsonConverterFromJson<String, UserStatus>(
          json['status'], const UserStatusJsonConverter().fromJson),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'nickName': instance.nickName,
      'mail': instance.mail,
      'phone': instance.phone,
      'location': _$JsonConverterToJson<GeoPoint, GeoPoint>(
          instance.location, const GeoPointJsonConverter().toJson),
      'devices': instance.devices,
      'favoritesSports': instance.favoritesSports,
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'status': _$JsonConverterToJson<String, UserStatus>(
          instance.status, const UserStatusJsonConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
