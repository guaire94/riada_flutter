import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  final GeoPoint location;
  final String address;
  final String city;
  final String country;

  Place({
    required this.location,
    required this.address,
    required this.city,
    required this.country,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    if (json['status'] == 'OK') {
      final components = json['result']['address_components'] as List<dynamic>;

      var city = "";
      var country = "";
      components.forEach((c) {
        final List type = c['types'];
        if (type.contains('locality')) {
          city = c['long_name'];
        }
        if (type.contains('country')) {
          country = c['long_name'];
        }
      });
      final address = json['result']['formatted_address'];
      final latitude = json['result']['geometry']['location']['lat'];
      final longitude = json['result']['geometry']['location']['lng'];

      return Place(
        location: GeoPoint(latitude, longitude),
        address: address,
        city: city,
        country: country,
      );
    }
    throw Exception(json['error_message']);
  }
}
