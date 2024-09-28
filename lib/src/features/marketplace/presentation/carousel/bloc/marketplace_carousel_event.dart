part of 'marketplace_carousel_bloc.dart';

abstract class MarketplaceCarouselEvent {}

class LoadEvent extends MarketplaceCarouselEvent {
  final MarketplaceCarouselType type;

  LoadEvent({required this.type});
}
