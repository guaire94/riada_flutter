import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';

class DSBooleanField extends StatelessWidget {
  final String _label;
  final bool _value;
  final ValueChanged<bool?> _onChanged;

  const DSBooleanField({
    Key? key,
    required String label,
    required bool value,
    required ValueChanged<bool?> onChanged,
  })  : _label = label,
        _value = value,
        _onChanged = onChanged,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
        color: DSColorV2.accent,
      ),
      padding: EdgeInsets.symmetric(
        vertical: DSSpacingV2.xxs,
        horizontal: DSSpacingV2.s,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _label,
            style: context.textTheme.bodyLarge?.copyWith(
              color: DSColorV2.secondary,
            ),
          ),
          Checkbox(
            value: _value,
            onChanged: _onChanged,
          ),
        ],
      ),
    );
  }
}
