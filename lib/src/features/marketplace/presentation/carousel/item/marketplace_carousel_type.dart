import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:template_flutter_app/src/router/routes.gr.dart';
import 'package:flutter/material.dart';

enum MarketplaceCarouselType {
  list,
}

extension MarketplaceCarouselTypeExtensions on MarketplaceCarouselType {
  double get height {
    switch (this) {
      case MarketplaceCarouselType.list:
        return DSListViewType.longCarousel.height;
    }
  }

  DSListViewType get listType {
    switch (this) {
      case MarketplaceCarouselType.list:
        return DSListViewType.longCarousel;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case MarketplaceCarouselType.list:
        return "List";
    }
  }

  PageRouteInfo pageRoute({required String id}) {
    switch (this) {
      case MarketplaceCarouselType.list:
        return DetailsRoute(productId: id);
    }
  }

  PageRouteInfo get seeAllPageRoute {
    switch (this) {
      case MarketplaceCarouselType.list:
        return ListRoute();
    }
  }
}
