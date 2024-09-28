part of 'details_bloc.dart';

abstract class DetailsState {}

class LoadingState extends DetailsState {}

class IdleState extends DetailsState {
  final Product product;

  IdleState({
    required this.product,
  });
}

class ErrorState extends DetailsState {}
