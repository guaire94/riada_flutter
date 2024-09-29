import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/component/dsList/shimmer/ds_list_view_shimmer.dart';
import 'package:flutter/material.dart';

class ListLoadingWidget extends StatelessWidget {
  final String title;
  final DSListViewType type;

  // MARK: - Life cycle
  const ListLoadingWidget({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DSListViewShimmer(
            type: type,
            title: title,
          ),
        ),
      ],
    );
  }
}
