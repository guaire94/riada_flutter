import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  final String placeId;
  final String placeName;
  final GeoPoint location;
  final String address;

  Place({
    required this.placeId,
    required this.placeName,
    required this.location,
    required this.address,
  });

  factory Place.fromJson(
    String placeId,
    String name,
    Map<String, dynamic> json,
  ) {
    if (json['status'] == 'OK') {
      final address = json['result']['formatted_address'];
      final latitude = json['result']['geometry']['location']['lat'];
      final longitude = json['result']['geometry']['location']['lng'];

      return Place(
        placeId: placeId,
        placeName: name,
        location: GeoPoint(latitude, longitude),
        address: address,
      );
    }
    throw Exception(json['error_message']);
  }
}
