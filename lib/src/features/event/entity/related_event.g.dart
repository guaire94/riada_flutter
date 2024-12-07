// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedEvent _$RelatedEventFromJson(Map<String, dynamic> json) => RelatedEvent(
      id: json['id'] as String?,
      eventId: json['eventId'] as String,
      title: json['title'] as String,
      date: const FirestoreTimestampJsonConverter()
          .fromJson(json['date'] as Timestamp),
      sportEmoticon: json['sportEmoticon'] as String,
    );

Map<String, dynamic> _$RelatedEventToJson(RelatedEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'title': instance.title,
      'date': const FirestoreTimestampJsonConverter().toJson(instance.date),
      'sportEmoticon': instance.sportEmoticon,
    };
