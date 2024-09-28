part of 'my_profile_bloc.dart';

abstract class MyProfileEvent {}

class LoadEvent extends MyProfileEvent {}

class ReloadEvent extends MyProfileEvent {}

class LogoutEvent extends MyProfileEvent {}
