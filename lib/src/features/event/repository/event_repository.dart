import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_more_data_available_exception.dart';
import 'package:riada/src/features/event/datasource/event_data_source.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventRepository {
  // MARK: -  Dependency
  final EventDataSource _eventDataSource;

  // MARK: - Properties
  List<Event> _items = [];

  // MARK: -  LifeCycle
  EventRepository({
    required EventDataSource eventDataSource,
  })  : _eventDataSource = eventDataSource,
        super();

  // MARK: - Public
  List<Event> get items => _items;

  Future loadMore() async {
    final events = await _eventDataSource.getEvents(limit: 20);

    if (events.isEmpty) {
      if (_items.isEmpty) throw NoDataAvailableException();

      throw NoMoreDataAvailableException();
    }

    _items.addAll(events);
  }

  Future<Event> getEventFrom({required String eventId}) async {
    return _eventDataSource.getEventFrom(eventId: eventId);
  }

  reset() {
    _items = [];
  }
}
