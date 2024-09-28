part of 'marketplace_carousel_bloc.dart';

abstract class MarketplaceCarouselState {}

class LoadingState extends MarketplaceCarouselState {}

class EmptyState extends MarketplaceCarouselState {}

class IdleState extends MarketplaceCarouselState {
  final List<MarketplaceCarouselItem> items;

  IdleState({required this.items});
}
