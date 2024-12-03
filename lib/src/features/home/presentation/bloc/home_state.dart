part of 'home_bloc.dart';

abstract class HomeState {}

class LaunchState extends HomeState {}

class IdleState extends HomeState {}

class ErrorState extends HomeState {}

class RedirectState extends HomeState {
  final String deeplink;

  RedirectState({
    required this.deeplink,
  });
}

class FinaliseSignUpState extends HomeState {}
