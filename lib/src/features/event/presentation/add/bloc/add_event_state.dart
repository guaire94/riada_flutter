part of 'add_event_bloc.dart';

abstract class AddEventState {}

class LoadingState extends AddEventState {}

class IdleState extends AddEventState {
  final bool onConfirmLoading;
  final Sport selectedSport;
  final String selectedCover;
  final List<Sport> sports;

  IdleState({
    required this.selectedSport,
    required this.selectedCover,
    required this.sports,
    this.onConfirmLoading = false,
  });

  bool get shouldRemoveGestures {
    return onConfirmLoading;
  }
}

class SuccessState extends AddEventState {}

class ErrorState extends AddEventState {}
