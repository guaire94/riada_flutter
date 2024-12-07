import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/geopoint_json_converter.dart';

part 'related_event.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@GeoPointJsonConverter()
class RelatedEvent {
  final String? id;
  final String eventId;
  final String title;
  final Timestamp date;
  final String sportEmoticon;

  RelatedEvent({
    this.id,
    required this.eventId,
    required this.title,
    required this.date,
    required this.sportEmoticon,
  });

  factory RelatedEvent.fromJson(Map<String, dynamic> json) =>
      _$RelatedEventFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedEventToJson(this);
}
