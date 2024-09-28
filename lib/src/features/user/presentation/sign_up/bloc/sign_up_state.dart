part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class LoadingState extends SignUpState {}

class IdleState extends SignUpState {
  final bool onSubmitLoading;
  final bool onGoogleSignInLoading;
  final bool onAppleSignInLoading;

  IdleState({
    this.onSubmitLoading = false,
    this.onGoogleSignInLoading = false,
    this.onAppleSignInLoading = false,
  });

  bool shouldRemoveGestures() {
    return onSubmitLoading || onGoogleSignInLoading || onAppleSignInLoading;
  }
}

class VerificationState extends SignUpState {}

class InvalidPhoneNumberState extends SignUpState {}

class InvalidSmsCodeState extends SignUpState {}

class SuccessState extends SignUpState {
  final bool shouldFinaliseSignUp;

  SuccessState({
    required this.shouldFinaliseSignUp,
  });
}

class ErrorState extends SignUpState {}

class InactiveState extends SignUpState {}
