part of 'additional_profile_information_bloc.dart';

abstract class AdditionalProfileInformationState {}

class LoadingState extends AdditionalProfileInformationState {}

class IdleState extends AdditionalProfileInformationState {
  final bool shouldProvidePhoneNumber;
  final bool shouldProvideEmail;
  final bool onSubmitLoading;

  IdleState({
    required this.shouldProvidePhoneNumber,
    required this.shouldProvideEmail,
    this.onSubmitLoading = false,
  });

  bool shouldRemoveGestures() {
    return onSubmitLoading;
  }
}

class SuccessState extends AdditionalProfileInformationState {}

class ErrorState extends AdditionalProfileInformationState {}
