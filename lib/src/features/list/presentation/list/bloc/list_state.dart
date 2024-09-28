part of 'list_bloc.dart';

abstract class ListState {}

class LoadingState extends ListState {}

class IdleState extends ListState {
  final List<Product> items;

  IdleState({
    required this.items,
  });
}

class EmptyState extends ListState {}

class ErrorState extends ListState {}
