part of 'add_event_bloc.dart';

abstract class AddEventEvent {}

class LoadEvent extends AddEventEvent {}

class ChangeSportEvent extends AddEventEvent {
  final Sport sport;

  ChangeSportEvent(this.sport);
}

class ChangeSportCoverEvent extends AddEventEvent {
  final String cover;

  ChangeSportCoverEvent(this.cover);
}

class SubmitEvent extends AddEventEvent {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final Place place;
  final String price;
  final bool isPrivate;
  final bool organizerIsParticipate;

  SubmitEvent(
    this.title,
    this.description,
    this.place,
    this.date,
    this.time,
    this.price,
    this.isPrivate,
    this.organizerIsParticipate,
  );
}
