import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';

class DSListViewItem extends StatelessWidget {
  // MARK: - Properties
  final DSListViewType _listType;
  final DSListItem _item;
  final void Function(DSListItem)? _onTap;
  final void Function(DSListItem)? _onDoubleTap;

  // MARK: - LifeCycle
  const DSListViewItem({
    Key? key,
    required DSListViewType listType,
    required DSListItem item,
    required void Function(DSListItem) onTap,
    void Function(DSListItem)? onDoubleTap,
  })  : _listType = listType,
        _item = item,
        _onTap = onTap,
        _onDoubleTap = onDoubleTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _listType.imageType.width,
      height: _listType.imageType.height,
      child: InkWell(
        onTap: () {
          if (_onTap != null) _onTap(_item);
        },
        onDoubleTap: () {
          if (_onDoubleTap != null) _onDoubleTap(_item);
        },
        child: Stack(
          children: [
            DSImageV2(
              type: _listType.imageType,
              url: _item.image,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [DSColorV2.secondary30, DSColorV2.secondary],
                ),
                borderRadius: _listType.imageType.borderRadius,
              ),
            ),
            Positioned(
              bottom: DSSpacingV2.s,
              left: DSSpacingV2.m,
              right: DSSpacingV2.s,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _item.title,
                          style: context.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: DSSpacingV2.xxs,
                        ),
                        Text(
                          _item.subtitle,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
