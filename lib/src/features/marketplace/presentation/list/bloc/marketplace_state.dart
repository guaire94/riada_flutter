part of 'marketplace_bloc.dart';

abstract class MarketplaceState {}

class LoadingState extends MarketplaceState {}

class IdleState extends MarketplaceState {
  final User? currentUser;

  IdleState({
    this.currentUser = null,
  });
}
