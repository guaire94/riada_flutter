part of 'details_bloc.dart';

abstract class DetailsEvent {}

class LoadEvent extends DetailsEvent {
  final String productId;

  LoadEvent({
    required this.productId,
  });
}
