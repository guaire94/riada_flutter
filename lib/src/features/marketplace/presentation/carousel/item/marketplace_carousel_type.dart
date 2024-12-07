import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/router/routes.gr.dart';
import 'package:riada/src/utils/build_context_extension.dart';

enum MarketplaceCarouselType {
  calendar,
  upcoming,
}

extension MarketplaceCarouselTypeExtensions on MarketplaceCarouselType {
  double get height {
    switch (this) {
      case MarketplaceCarouselType.calendar:
        return DSListViewType.longCarousel.height;
      case MarketplaceCarouselType.upcoming:
        return DSListViewType.smallCarousel.height;
    }
  }

  DSListViewType get listType {
    switch (this) {
      case MarketplaceCarouselType.calendar:
        return DSListViewType.longCarousel;
      case MarketplaceCarouselType.upcoming:
        return DSListViewType.smallCarousel;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case MarketplaceCarouselType.calendar:
        return context.l10N.marketplace_calendar_title;
      case MarketplaceCarouselType.upcoming:
        return context.l10N.marketplace_upcoming_title;
    }
  }

  PageRouteInfo pageRoute({required String id}) {
    switch (this) {
      case MarketplaceCarouselType.calendar:
      case MarketplaceCarouselType.upcoming:
        return EventDetailsRoute(eventId: id);
    }
  }

  PageRouteInfo get seeAllPageRoute {
    switch (this) {
      case MarketplaceCarouselType.calendar:
      case MarketplaceCarouselType.upcoming:
        return EventListRoute();
    }
  }
}
