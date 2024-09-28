part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class LoadEvent extends SignUpEvent {}

class VerifyPhoneNumberEvent extends SignUpEvent {
  final String phoneNumber;

  VerifyPhoneNumberEvent({
    required this.phoneNumber,
  });
}

class VerifySmsCodeEvent extends SignUpEvent {
  final String smsCode;

  VerifySmsCodeEvent({
    required this.smsCode,
  });
}

class SignWithGoogleEvent extends SignUpEvent {}

class SignWithAppleEvent extends SignUpEvent {}
