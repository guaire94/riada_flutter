part of 'event_list_bloc.dart';

abstract class EventListEvent {}

class LoadEvent extends EventListEvent {}

class RefreshEvent extends EventListEvent {}
