part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState {}

class LoadingState extends ForgetPasswordState {}

class IdleState extends ForgetPasswordState {
  final bool showLoading;

  IdleState({
    this.showLoading = false,
  });
}

class SuccessState extends ForgetPasswordState {}

class ErrorState extends ForgetPasswordState {}
