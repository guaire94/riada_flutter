part of 'my_profile_bloc.dart';

abstract class MyProfileState {}

class LoadingState extends MyProfileState {}

class IdleState extends MyProfileState {
  final User user;

  IdleState({
    required this.user,
  });
}

class SuccessState extends MyProfileState {}

class LogoutState extends MyProfileState {}

class ErrorState extends MyProfileState {}
