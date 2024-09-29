import 'package:riada/src/design_system/ds_border_radius.dart';
import 'package:riada/src/design_system/ds_spacing.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSSegmentItemWidget extends StatelessWidget {
  // MARK: - Constants
  static const double _buttonWidth = 154;

  // MARK: - Properties
  final String text;
  final bool isSelected;
  final void Function()? onTap;

  // MARK: - Life cycle
  DSSegmentItemWidget({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? DSColorV2.secondary : DSColorV2.neutral70;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: _buttonWidth,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: DSSpacing.sizeXs),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DSBorderRadius.input),
            border: Border.all(
              color: color,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: context.textTheme.bodyLarge?.copyWith(
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
