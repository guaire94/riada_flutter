import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:flutter/widgets.dart';

enum DSListViewType {
  smallGrid,
  longGrid,
  largeCarousel,
  longCarousel,
  smallCarousel
}

extension DSListViewTypeExtension on DSListViewType {
  DSImageTypeV2 get imageType {
    switch (this) {
      case DSListViewType.smallGrid:
        return DSImageTypeV2.fullScreen;
      case DSListViewType.longGrid:
        return DSImageTypeV2.fullLong;
      case DSListViewType.largeCarousel:
        return DSImageTypeV2.l;
      case DSListViewType.longCarousel:
        return DSImageTypeV2.shortLong;
      case DSListViewType.smallCarousel:
        return DSImageTypeV2.s;
    }
  }

  double get height {
    switch (this) {
      case DSListViewType.smallGrid:
      case DSListViewType.longGrid:
        return double.infinity;
      case DSListViewType.largeCarousel:
        return 258;
      case DSListViewType.longCarousel:
        return 186;
      case DSListViewType.smallCarousel:
        return 190;
    }
  }

  bool get seeAllButton {
    switch (this) {
      case DSListViewType.smallGrid:
      case DSListViewType.longGrid:
        return false;
      case DSListViewType.largeCarousel:
      case DSListViewType.longCarousel:
      case DSListViewType.smallCarousel:
        return true;
    }
  }

  Axis get scrollDirection {
    switch (this) {
      case DSListViewType.smallGrid:
      case DSListViewType.longGrid:
        return Axis.vertical;
      case DSListViewType.largeCarousel:
      case DSListViewType.longCarousel:
      case DSListViewType.smallCarousel:
        return Axis.horizontal;
    }
  }

  int get nbShimmerItems {
    switch (this) {
      case DSListViewType.smallGrid:
        return 12;
      case DSListViewType.longGrid:
        return 8;
      case DSListViewType.largeCarousel:
      case DSListViewType.longCarousel:
      case DSListViewType.smallCarousel:
        return 3;
    }
  }
}
