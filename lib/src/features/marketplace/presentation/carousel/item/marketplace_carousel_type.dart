import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/router/routes.gr.dart';
import 'package:flutter/material.dart';

enum MarketplaceCarouselType {
  events,
}

extension MarketplaceCarouselTypeExtensions on MarketplaceCarouselType {
  double get height {
    switch (this) {
      case MarketplaceCarouselType.events:
        return DSListViewType.longCarousel.height;
    }
  }

  DSListViewType get listType {
    switch (this) {
      case MarketplaceCarouselType.events:
        return DSListViewType.longCarousel;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case MarketplaceCarouselType.events:
        return "Events";
    }
  }

  PageRouteInfo pageRoute({required String id}) {
    switch (this) {
      case MarketplaceCarouselType.events:
        return EventDetailsRoute(eventId: id);
    }
  }

  PageRouteInfo get seeAllPageRoute {
    switch (this) {
      case MarketplaceCarouselType.events:
        return EventListRoute();
    }
  }
}
