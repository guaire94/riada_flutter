import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSButtonTextV2 extends StatelessWidget {
  // MARK: - Properties
  final String _text;
  final void Function()? _onPressed;

  // MARK: - LifeCycle
  const DSButtonTextV2({
    Key? key,
    required String text,
    void Function()? onPressed,
  })  : _text = text,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onPressed,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
            color: DSColorV2.neutral10,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: DSSpacingV2.xxs,
              horizontal: DSSpacingV2.s,
            ),
            child: Text(
              _text,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                color: DSColorV2.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
