import 'package:template_flutter_app/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:template_flutter_app/src/features/list/entity/product.dart';
import 'package:flutter/widgets.dart';

class ProductListItem implements DSListItem {
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

  ProductListItem({
    required Product product,
    required BuildContext context,
  })  : id = product.id,
        title = product.title,
        subtitle = product.priceDescription(context),
        image = product.images.first;
}
