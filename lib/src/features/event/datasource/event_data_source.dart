import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/datasource/base_firestore_data_source.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/entity/related_event.dart';
import 'package:riada/src/features/event/entity/sport.dart';
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
  Future<List<RelatedEvent>> getNextEventParticipations(String userId) async {
    try {
      Query query = await userParticipateEventCollection(userId)
          .where("date", isGreaterThan: DateTime.now());

      final querySnapshot = await query.get();
      return querySnapshot.docs.map((event) {
        final data = event.data() as Map<String, dynamic>?;
        if (data == null) {
          throw NoDataAvailableException();
        }
        data["id"] = event.id;
        return RelatedEvent.fromJson(data);
      }).toList();
    } catch (_) {
      return [];
    }
  }

  Future<List<RelatedEvent>> getNextEventOrganizations(String userId) async {
    try {
      Query query = await userOrganizeEventCollection(userId)
          .where("date", isGreaterThan: DateTime.now());

      final querySnapshot = await query.get();
      return querySnapshot.docs.map((event) {
        final data = event.data() as Map<String, dynamic>?;
        if (data == null) {
          throw NoDataAvailableException();
        }
        data["id"] = event.id;
        return RelatedEvent.fromJson(data);
      }).toList();
    } catch (_) {
      return [];
    }
  }

  Future<List<Event>> getNextNearestEvents({
    required City city,
    Sport? sport,
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
          .where("isPrivate", isEqualTo: false)
          .where("date", isGreaterThan: DateTime.now());

      if (sport != null) {
        query.where("sportId", isEqualTo: sport.id);
      }

      final querySnapshot = await query.get();
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
