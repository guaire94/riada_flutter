import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class DistanceHelper {
  // Constants
  static const double maxMilesDistance = 20;
  static const double oneMileLat = 0.0144927536231884;
  static const double oneMileLng = 0.0181818181818182;

  // Public methods
  GeoPoint computeLesserGeoPoint(GeoPoint geoPoint) {
    final double lowerLat = geoPoint.latitude - (oneMileLat * maxMilesDistance);
    final double lowerLon =
        geoPoint.longitude - (oneMileLng * maxMilesDistance);

    return GeoPoint(lowerLat, lowerLon);
  }

  GeoPoint computeGreatestGeoPoint(GeoPoint geoPoint) {
    final double greaterLat =
        geoPoint.latitude + (oneMileLat * maxMilesDistance);
    final double greaterLon =
        geoPoint.longitude + (oneMileLng * maxMilesDistance);

    return GeoPoint(greaterLat, greaterLon);
  }
}
