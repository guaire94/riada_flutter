import 'package:riada/src/features/event/entity/event_status.dart';
import 'package:json_annotation/json_annotation.dart';

class EventStatusJsonConverter extends JsonConverter<EventStatus, String> {
  const EventStatusJsonConverter();

  @override
  EventStatus fromJson(String eventStatus) {
    return EventStatus.values
        .firstWhere((element) => element.name == eventStatus);
  }

  @override
  String toJson(EventStatus eventStatus) {
    return eventStatus.name;
  }
}
