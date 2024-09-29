import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:flutter/material.dart';

class DSButtonOutlineV2 extends StatelessWidget {
  // MARK: - Constants
  static const double _height = 48;
  static const double _width = 205;

  // MARK: - Properties
  final String _text;
  final bool _isLoading;
  final void Function()? _onPressed;

  // MARK: - LifeCycle
  const DSButtonOutlineV2({
    Key? key,
    required String text,
    bool isLoading = false,
    void Function()? onPressed,
  })  : _text = text,
        _onPressed = onPressed,
        _isLoading = isLoading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed = _isLoading == true ? null : _onPressed;
    final Widget content = _isLoading == true
        ? Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
            ),
          )
        : Center(
            child: Text(
              _text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: DSColorV2.primary,
                  ),
            ),
          );

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
        ),
        side: BorderSide(color: DSColorV2.primary),
      ),
      onPressed: onPressed,
      child: Container(
        width: _width,
        height: _height,
        child: content,
      ),
    );
  }
}
