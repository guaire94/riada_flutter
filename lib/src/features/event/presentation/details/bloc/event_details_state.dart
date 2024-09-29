part of 'event_details_bloc.dart';

abstract class EventDetailsState {}

class LoadingState extends EventDetailsState {}

class IdleState extends EventDetailsState {
  final Event event;

  IdleState({
    required this.event,
  });
}

class ErrorState extends EventDetailsState {}
