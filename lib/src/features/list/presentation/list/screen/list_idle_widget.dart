import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/src/design_system/v2/component/dsList/ds_list_view.dart';
import 'package:template_flutter_app/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:template_flutter_app/src/features/list/presentation/common/item/product_list_item.dart';
import 'package:template_flutter_app/src/features/list/presentation/list/bloc/list_bloc.dart';
import 'package:template_flutter_app/src/router/routes.gr.dart';
import 'package:flutter/material.dart';

class ListIdleWidget extends StatefulWidget {
  // MARK: - Dependencies
  final IdleState _state;
  final Future<void> Function() _onRefresh;
  // MARK: - Life cycle
  const ListIdleWidget({
    Key? key,
    required IdleState state,
    required Future<void> Function() onRefresh,
  })  : _state = state,
        _onRefresh = onRefresh,
        super(key: key);

  @override
  State<ListIdleWidget> createState() => _ListIdleWidgetState();
}

class _ListIdleWidgetState extends State<ListIdleWidget> {
  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DSListView(
            type: DSListViewType.smallGrid,
            title: "List",
            items: _productListItems(),
            onTap: (item) {
              context.pushRoute(DetailsRoute(productId: item.id));
            },
            onRefresh: widget._onRefresh,
          ),
        ),
      ],
    );
  }

  // MARK: - Private
  List<ProductListItem> _productListItems() {
    return widget._state.items
        .map(
          (product) => ProductListItem(
            product: product,
            context: context,
          ),
        )
        .toList();
  }
}
