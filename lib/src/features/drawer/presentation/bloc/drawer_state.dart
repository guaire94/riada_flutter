part of 'drawer_bloc.dart';

abstract class DrawerState {}

class LoadingState extends DrawerState {}

class IdleState extends DrawerState {
  final User? currentUser;

  IdleState({
    this.currentUser = null,
  });
}

class LoginSuccessState extends DrawerState {}
