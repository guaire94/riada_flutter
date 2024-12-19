// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      cover: json['cover'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      date: const FirestoreTimestampJsonConverter()
          .fromJson(json['date'] as Timestamp),
      price: (json['price'] as num?)?.toDouble(),
      isPrivate: json['isPrivate'] as bool,
      placeName: json['placeName'] as String,
      placeAddress: json['placeAddress'] as String,
      placeCoordinate: const GeoPointJsonConverter()
          .fromJson(json['placeCoordinate'] as GeoPoint),
      sportEmoticon: json['sportEmoticon'] as String,
      sportId: json['sportId'] as String,
      sportName: json['sportName'] as String,
      status:
          const EventStatusJsonConverter().fromJson(json['status'] as String),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'title': instance.title,
      'description': instance.description,
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'date': const FirestoreTimestampJsonConverter().toJson(instance.date),
      'price': instance.price,
      'isPrivate': instance.isPrivate,
      'placeName': instance.placeName,
      'placeAddress': instance.placeAddress,
      'placeCoordinate':
          const GeoPointJsonConverter().toJson(instance.placeCoordinate),
      'sportEmoticon': instance.sportEmoticon,
      'sportId': instance.sportId,
      'sportName': instance.sportName,
      'status': const EventStatusJsonConverter().toJson(instance.status),
    };
