part of 'marketplace_bloc.dart';

abstract class MarketplaceEvent {}

class LoadEvent extends MarketplaceEvent {}

class ChangeCityEvent extends MarketplaceEvent {
  final City? city;

  ChangeCityEvent(this.city);
}
