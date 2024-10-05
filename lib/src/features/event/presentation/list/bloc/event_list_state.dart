part of 'event_list_bloc.dart';

abstract class EventListState {}

class LoadingState extends EventListState {}

class IdleState extends EventListState {
  final List<Event> events;

  IdleState({
    required this.events,
  });
}

class EmptyState extends EventListState {}

class ErrorState extends EventListState {}
