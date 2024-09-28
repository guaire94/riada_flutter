import 'package:template_flutter_app/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:template_flutter_app/src/utils/timestamp_extension.dart';
import 'package:flutter/material.dart';

abstract class MarketplaceCarouselItem {
  String get id;
  String get title;
  String price(BuildContext context);
  String get image;
  DateTime? get date;

  DSListItem listItem(BuildContext context) {
    String? rightTopCornerText;
    if (date != null) {
      rightTopCornerText = date!.dateDescription;
    }
    return _DSListItem(
      id: id,
      title: title,
      subtitle: price(context),
      image: image,
      rightTopCornerText: rightTopCornerText,
    );
  }
}

class ProductMarketplaceItem extends MarketplaceCarouselItem {
  final Product product;

  ProductMarketplaceItem({
    required this.product,
  });

  @override
  String get id => product.id;

  @override
  String get title => product.title;

  @override
  String price(BuildContext context) {
    return product.priceDescription(context);
  }

  @override
  DateTime? get date => null;

  @override
  String get image => product.images.first;
}

class _DSListItem implements DSListItem {
  @override
  String id;
  @override
  String title;
  @override
  String subtitle;
  @override
  String image;

  @override
  String? rightTopCornerText;

  _DSListItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    this.rightTopCornerText,
  });
}
