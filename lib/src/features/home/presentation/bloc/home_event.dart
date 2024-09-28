part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadEvent extends HomeEvent {}

class ReloadEvent extends HomeEvent {}

class RedirectEvent extends HomeEvent {
  final String deeplink;

  RedirectEvent({
    required this.deeplink,
  });
}
