import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riada/src/features/common/entity/google_place/place.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/geopoint_json_converter.dart';
import 'package:riada/src/features/event/entity/event_status.dart';
import 'package:riada/src/features/event/entity/json_converter/event_status_json_converter.dart';
import 'package:riada/src/features/event/entity/related_event.dart';
import 'package:riada/src/features/event/entity/sport.dart';
import 'package:riada/src/utils/random.dart';

part 'event.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@GeoPointJsonConverter()
@EventStatusJsonConverter()
class Event {
  final String id;
  final String? cover;
  final String title;
  final String description;
  final Timestamp createdDate;
  final Timestamp date;
  final double? price;
  final bool isPrivate;
  final String placeName;
  final String placeAddress;
  final GeoPoint placeCoordinate;
  final String sportEmoticon;
  final String sportId;
  final String sportName;
  final EventStatus status;

  Event({
    required this.id,
    required this.cover,
    required this.title,
    required this.description,
    required this.createdDate,
    required this.date,
    required this.price,
    required this.isPrivate,
    required this.placeName,
    required this.placeAddress,
    required this.placeCoordinate,
    required this.sportEmoticon,
    required this.sportId,
    required this.sportName,
    required this.status,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  Event copyWith({
    String? id,
    String? cover,
    String? title,
    String? description,
    Timestamp? createdDate,
    Timestamp? date,
    double? price,
    bool? isPrivate,
    String? placeName,
    String? placeAddress,
    GeoPoint? placeCoordinate,
    String? sportEmoticon,
    String? sportId,
    String? sportName,
    EventStatus? status,
  }) {
    return Event(
      id: id ?? this.id,
      cover: cover ?? this.cover,
      title: title ?? this.title,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
      date: date ?? this.date,
      price: price ?? this.price,
      isPrivate: isPrivate ?? this.isPrivate,
      placeName: placeName ?? this.placeName,
      placeAddress: placeAddress ?? this.placeAddress,
      placeCoordinate: placeCoordinate ?? this.placeCoordinate,
      sportEmoticon: sportEmoticon ?? this.sportEmoticon,
      sportId: sportId ?? this.sportId,
      sportName: sportName ?? this.sportName,
      status: status ?? this.status,
    );
  }

  factory Event.toNewEvent({
    required Sport sport,
    required String cover,
    required String title,
    required String description,
    required double price,
    required Place place,
    required Timestamp date,
    required bool isPrivate,
  }) =>
      Event(
        id: generateRandomString(),
        cover: cover,
        title: title,
        description: description,
        createdDate: Timestamp.now(),
        date: date,
        price: price,
        isPrivate: isPrivate,
        placeName: place.placeName,
        placeAddress: place.address,
        placeCoordinate: place.location,
        sportEmoticon: sport.emoticon,
        sportId: sport.id,
        sportName: sport.name,
        status: EventStatus.open,
      );

  RelatedEvent toRelated() {
    return RelatedEvent(
      eventId: id,
      title: title,
      date: date,
      sportEmoticon: sportEmoticon,
    );
  }
}
