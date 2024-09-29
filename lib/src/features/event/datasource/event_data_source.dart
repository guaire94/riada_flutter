import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riada/src/features/common/datasource/base_firestore_data_source.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/entity/event_status.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventDataSource extends BaseFirestoreDataSource {
  // MARK: - LifeCycle
  EventDataSource({required super.envConfigurationDataSource});

  // MARK: - Public
  Future<List<Event>> getEvents({
    required int limit,
  }) async {
    Query query = await eventCollection()
        .orderBy('createdDate', descending: true)
        .where("status", isEqualTo: EventStatus.open.name)
        .where("isPrivate", isEqualTo: false)
        .limit(limit);

    final querySnapshot = await query.get();

    return querySnapshot.docs.map((product) {
      final data = product.data() as Map<String, dynamic>?;
      if (data == null) {
        throw NoDataAvailableException();
      }
      return Event.fromJson(data);
    }).toList();
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
