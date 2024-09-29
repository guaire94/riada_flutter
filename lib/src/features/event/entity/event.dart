import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/geopoint_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@GeoPointJsonConverter()
class Event {
  final String id;
  final String title;
  final String description;
  final Timestamp createdDate;
  final Timestamp date;
  final bool isPrivate;
  final int nbPlayer;
  final String placeAddress;
  final GeoPoint placeCoordinate;
  final String placeId;
  final String placeName;
  final String sportEmoticon;
  final String sportId;
  final String sportName;
  final String status;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.createdDate,
    required this.date,
    required this.isPrivate,
    required this.nbPlayer,
    required this.placeAddress,
    required this.placeCoordinate,
    required this.placeId,
    required this.placeName,
    required this.sportEmoticon,
    required this.sportId,
    required this.sportName,
    required this.status,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  Event copyWith({
    String? id,
    String? title,
    String? description,
    Timestamp? createdDate,
    Timestamp? date,
    bool? isPrivate,
    int? nbPlayer,
    String? placeAddress,
    GeoPoint? placeCoordinate,
    String? placeId,
    String? placeName,
    String? sportEmoticon,
    String? sportId,
    String? sportName,
    String? status,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
      date: date ?? this.date,
      isPrivate: isPrivate ?? this.isPrivate,
      nbPlayer: nbPlayer ?? this.nbPlayer,
      placeAddress: placeAddress ?? this.placeAddress,
      placeCoordinate: placeCoordinate ?? this.placeCoordinate,
      placeId: placeId ?? this.placeId,
      placeName: placeName ?? this.placeName,
      sportEmoticon: sportEmoticon ?? this.sportEmoticon,
      sportId: sportId ?? this.sportId,
      sportName: sportName ?? this.sportName,
      status: status ?? this.status,
    );
  }
}
