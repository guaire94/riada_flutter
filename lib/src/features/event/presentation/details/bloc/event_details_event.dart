part of 'event_details_bloc.dart';

abstract class EventDetailsEvent {}

class LoadEvent extends EventDetailsEvent {
  final String eventId;

  LoadEvent({
    required this.eventId,
  });
}
