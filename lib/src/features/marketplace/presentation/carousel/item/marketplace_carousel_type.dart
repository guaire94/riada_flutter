import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/router/routes.gr.dart';
import 'package:riada/src/utils/build_context_extension.dart';

enum MarketplaceCarouselType {
  calendar,
  upcoming,
  soccer,
}

extension MarketplaceCarouselTypeExtensions on MarketplaceCarouselType {
  double get height {
    return listType.height;
  }

  DSListViewType get listType {
    switch (this) {
      case MarketplaceCarouselType.calendar:
        return DSListViewType.longCarousel;
      case MarketplaceCarouselType.upcoming:
        return DSListViewType.smallCarousel;
      case MarketplaceCarouselType.soccer:
        return DSListViewType.smallCarousel;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case MarketplaceCarouselType.calendar:
        return context.l10N.marketplace_calendar_title;
      case MarketplaceCarouselType.upcoming:
        return context.l10N.marketplace_upcoming_title;
      case MarketplaceCarouselType.soccer:
        return context.l10N.marketplace_soccer_title;
    }
  }

  PageRouteInfo pageRoute({required String id}) {
    switch (this) {
      case MarketplaceCarouselType.calendar:
      case MarketplaceCarouselType.upcoming:
      case MarketplaceCarouselType.soccer:
        return EventDetailsRoute(eventId: id);
    }
  }

  PageRouteInfo get seeAllPageRoute {
    switch (this) {
      case MarketplaceCarouselType.calendar:
      case MarketplaceCarouselType.upcoming:
      case MarketplaceCarouselType.soccer:
        return EventListRoute();
    }
  }
}
