import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/event/datasource/event_data_source.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/utils/city.dart';

@injectable
class EventRepository {
  // MARK: -  Dependency
  final EventDataSource _eventDataSource;

  // MARK: -  LifeCycle
  EventRepository({
    required EventDataSource eventDataSource,
  })  : _eventDataSource = eventDataSource,
        super();

  Future<List<Event>> getNextNearestEvents({
    required City city,
  }) async {
    final events = await _eventDataSource.getNextNearestEvents(
      city: city,
    );

    if (events.isEmpty) {
      throw NoDataAvailableException();
    }

    return events;
  }

  Future<Event> getEventFrom({required String eventId}) async {
    return _eventDataSource.getEventFrom(eventId: eventId);
  }

  Future add(
      {required Event event, required bool isOrganizerParticipate}) async {
    await _eventDataSource.add(event: event);
    if (isOrganizerParticipate) {
      await _eventDataSource.participate(event: event);
    }
  }
}
