// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertising.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertising _$AdvertisingFromJson(Map<String, dynamic> json) => Advertising(
      id: json['id'] as String,
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      startDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['startDate'] as Timestamp),
      endDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['endDate'] as Timestamp),
      sourceTab: const AdvertisingSourceTabJsonConverter()
          .fromJson(json['sourceTab'] as String),
      type:
          const AdvertisingTypeJsonConverter().fromJson(json['type'] as String),
      contentType: const AdvertisingContentTypeJsonConverter()
          .fromJson(json['contentType'] as String),
      content: const FirestoreDocumentReferenceJsonConverter()
          .fromJson(json['content'] as DocumentReference<Object?>),
    );

Map<String, dynamic> _$AdvertisingToJson(Advertising instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'startDate':
          const FirestoreTimestampJsonConverter().toJson(instance.startDate),
      'endDate':
          const FirestoreTimestampJsonConverter().toJson(instance.endDate),
      'sourceTab':
          const AdvertisingSourceTabJsonConverter().toJson(instance.sourceTab),
      'type': const AdvertisingTypeJsonConverter().toJson(instance.type),
      'contentType': const AdvertisingContentTypeJsonConverter()
          .toJson(instance.contentType),
      'content': const FirestoreDocumentReferenceJsonConverter()
          .toJson(instance.content),
    };
