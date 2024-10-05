import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/datasource/base_firestore_data_source.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/helper/distance_helper.dart';
import 'package:riada/src/utils/city.dart';

@injectable
class EventDataSource extends BaseFirestoreDataSource {
  // MARK: - Dependencies
  final DistanceHelper distanceHelper;

  // MARK: - LifeCycle
  EventDataSource({
    required super.envConfigurationDataSource,
    required this.distanceHelper,
  });

  // MARK: - Public
  Future<List<Event>> getNextNearestEvents({
    required String sportId,
    required City city,
  }) async {
    try {
      final lesserGeoPoint =
          distanceHelper.computeLesserGeoPoint(city.geoPoint);
      final greaterGeoPoint =
          distanceHelper.computeGreatestGeoPoint(city.geoPoint);

      Query query = await eventCollection()
          .orderBy("placeCoordinate")
          .where("placeCoordinate", isGreaterThan: lesserGeoPoint)
          .where("placeCoordinate", isLessThan: greaterGeoPoint)
          .where("sportId", isEqualTo: sportId)
          .where("isPrivate", isEqualTo: false);

      final querySnapshot = await query.get();
      print(querySnapshot);
      return querySnapshot.docs.map((event) {
        final data = event.data() as Map<String, dynamic>?;
        if (data == null) {
          throw NoDataAvailableException();
        }
        data["id"] = event.id;
        return Event.fromJson(data);
      }).toList();
    } catch (_) {
      return [];
    }
  }

  Future<Event> getEventFrom({required String eventId}) async {
    final event = await eventReference(eventId: eventId).get();
    final data = event.data() as Map<String, dynamic>?;
    if (data == null) {
      throw new NoDataAvailableException();
    }
    return Event.fromJson(data);
  }
}
