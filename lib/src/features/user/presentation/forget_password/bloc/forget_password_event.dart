part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent {}

class LoadEvent extends ForgetPasswordEvent {}

class ResetPasswordEvent extends ForgetPasswordEvent {
  final String email;

  ResetPasswordEvent({
    required this.email,
  });
}
