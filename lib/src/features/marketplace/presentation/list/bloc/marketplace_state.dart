part of 'marketplace_bloc.dart';

abstract class MarketplaceState {}

class LoadingState extends MarketplaceState {}

class IdleState extends MarketplaceState {
  final List<City> cities;
  final City selectedCity;

  IdleState({
    required this.cities,
    required this.selectedCity,
  });
}
