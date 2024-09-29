import 'package:riada/src/design_system/ds_border_radius.dart';
import 'package:riada/src/design_system/ds_color.dart';
import 'package:riada/src/design_system/ds_spacing.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSLabel extends StatelessWidget {
  // MARK: Dependencies
  final String _title;
  final Color _backgroundColor;
  final Color _foregroundColor;

  // MARK: LifeCycle
  const DSLabel({
    super.key,
    required String title,
    Color backgroundColor = DSColor.yellow100,
    Color foregroundColor = DSColor.primary100,
  })  : _title = title,
        _backgroundColor = backgroundColor,
        _foregroundColor = foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(DSBorderRadius.normal),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: DSSpacing.sizeS,
          vertical: DSSpacing.sizeXxxs,
        ),
        child: Text(
          _title,
          style: context.textTheme.headlineMedium?.copyWith(
            color: _foregroundColor,
          ),
        ),
      ),
    );
  }
}
