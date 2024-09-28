part of 'update_additional_profile_information_bloc.dart';

abstract class UpdateAdditionalProfileInformationState {}

class LoadingState extends UpdateAdditionalProfileInformationState {}

class IdleState extends UpdateAdditionalProfileInformationState {
  final User user;
  final bool onSubmitLoading;

  IdleState({
    this.onSubmitLoading = false,
    required this.user,
  });

  bool shouldRemoveGestures() {
    return onSubmitLoading;
  }
}

class SuccessState extends UpdateAdditionalProfileInformationState {}

class NoDataState extends UpdateAdditionalProfileInformationState {}

class ErrorState extends UpdateAdditionalProfileInformationState {}

class DeleteSuccessState extends UpdateAdditionalProfileInformationState {}
