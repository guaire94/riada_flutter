import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/bloc/marketplace_carousel_bloc.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:flutter/material.dart';

class MarketplaceCarouselIdleWidget extends StatelessWidget {
  // MARK: - Properties
  final IdleState _state;
  final MarketplaceCarouselType _type;

  // MARK: - Life cycle
  MarketplaceCarouselIdleWidget({
    Key? key,
    required IdleState state,
    required MarketplaceCarouselType type,
  })  : _state = state,
        _type = type,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItem = _state.items.map((e) => e.listItem(context)).toList();
    return Container(
      height: _type.height,
      child: DSListView(
        type: _type.listType,
        title: _type.title(context),
        items: listItem,
        onTap: (element) {
          context.router.push(_type.pageRoute(id: element.id));
        },
        onRefresh: () async {},
        onSeeAllPressed: () {
          context.router.navigate(_type.seeAllPageRoute);
        },
      ),
    );
  }
}
