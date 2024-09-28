import 'package:template_flutter_app/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:template_flutter_app/src/design_system/v2/component/dsList/shimmer/ds_list_view_shimmer.dart';
import 'package:flutter/material.dart';

class ListLoadingWidget extends StatelessWidget {
  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DSListViewShimmer(
            type: DSListViewType.smallGrid,
            title: "List",
          ),
        ),
      ],
    );
  }
}
