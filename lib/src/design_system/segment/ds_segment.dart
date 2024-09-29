import 'package:riada/src/design_system/segment/ds_segment_controller.dart';
import 'package:riada/src/design_system/segment/ds_segment_item_widget.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSSegment extends StatefulWidget {
  final DSSegmentController _controller;
  final String _title;
  final void Function()? onChanged;

  DSSegment({
    required DSSegmentController controller,
    required String title,
    void Function()? onChanged = null,
  })  : _controller = controller,
        _title = title,
        onChanged = onChanged;

  @override
  _DSSegmentState createState() => _DSSegmentState();
}

class _DSSegmentState extends State<DSSegment> {
  // MARK: - Constants
  static const double _listHeight = 48;

  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    final items = widget._controller.items;
    final selectedItem = widget._controller.selectItem;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: DSSpacingV2.xxs),
          child: Text(
            widget._title,
            style: context.textTheme.bodySmall?.copyWith(
              color: DSColorV2.neutral70,
            ),
          ),
        ),
        SizedBox(height: DSSpacingV2.xxs),
        Container(
          height: _listHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isSelected = selectedItem.content == item.content;
              return DSSegmentItemWidget(
                text: item.content,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    widget._controller.selectItem = items[index];
                    if (widget.onChanged != null) widget.onChanged!();
                  });
                },
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: DSSpacingV2.s),
          ),
        ),
      ],
    );
  }
}
