import 'package:template_flutter_app/src/design_system/ds_color.dart';
import 'package:template_flutter_app/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:flutter/material.dart';

class DSListViewShimmerItem extends StatelessWidget {
  // MARK: - Properties
  final DSListViewType _listType;
  // MARK: - LifeCycle
  const DSListViewShimmerItem({
    Key? key,
    required DSListViewType listType,
  })  : _listType = listType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _listType.imageType.width,
      height: _listType.imageType.height,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: _listType.imageType.height,
        width: _listType.imageType.width,
        decoration: BoxDecoration(
          color: DSColor.neutral10,
          borderRadius: _listType.imageType.borderRadius,
        ),
      ),
    );
  }
}
