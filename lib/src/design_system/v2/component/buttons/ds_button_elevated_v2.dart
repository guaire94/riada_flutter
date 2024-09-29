import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:flutter/material.dart';

class DSButtonElevatedV2 extends StatelessWidget {
  // MARK: - Constants
  static const double _height = 40;
  static const double _width = 205;

  // MARK: - Properties
  final String _text;
  final bool _isLoading;
  final bool _isEnable;
  final void Function()? _onPressed;

  // MARK: - LifeCycle
  const DSButtonElevatedV2({
    Key? key,
    required String text,
    bool isLoading = false,
    bool isEnable = true,
    void Function()? onPressed,
  })  : _text = text,
        _onPressed = onPressed,
        _isLoading = isLoading,
        _isEnable = isEnable,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed =
        _isLoading == true || _isEnable == false ? null : _onPressed;
    Widget? content = _isLoading == true
        ? Center(
            child: SizedBox(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          )
        : Center(
            child: Text(
              _text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: DSColorV2.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
        ),
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
