// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      date: const FirestoreTimestampJsonConverter()
          .fromJson(json['date'] as Timestamp),
      isPrivate: json['isPrivate'] as bool,
      nbPlayer: (json['nbPlayer'] as num).toInt(),
      placeAddress: json['placeAddress'] as String,
      placeCoordinate: const GeoPointJsonConverter()
          .fromJson(json['placeCoordinate'] as GeoPoint),
      placeId: json['placeId'] as String,
      placeName: json['placeName'] as String,
      sportEmoticon: json['sportEmoticon'] as String,
      sportId: json['sportId'] as String,
      sportName: json['sportName'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'date': const FirestoreTimestampJsonConverter().toJson(instance.date),
      'isPrivate': instance.isPrivate,
      'nbPlayer': instance.nbPlayer,
      'placeAddress': instance.placeAddress,
      'placeCoordinate':
          const GeoPointJsonConverter().toJson(instance.placeCoordinate),
      'placeId': instance.placeId,
      'placeName': instance.placeName,
      'sportEmoticon': instance.sportEmoticon,
      'sportId': instance.sportId,
      'sportName': instance.sportName,
      'status': instance.status,
    };
