import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/component/dsList/shimmer/ds_list_view_shimmer.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:flutter/material.dart';

class MarketplaceCarouselLoadingWidget extends StatelessWidget {
  // MARK: - Properties
  final MarketplaceCarouselType _type;

  // MARK: - Life cycle
  MarketplaceCarouselLoadingWidget({
    Key? key,
    required MarketplaceCarouselType type,
  })  : _type = type,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _type.listType.height,
      child: DSListViewShimmer(
        type: _type.listType,
        title: _type.title(context),
      ),
    );
  }
}
