import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:flutter/material.dart';

enum DSIconButtonType { apple, google }

extension DSIconButtonTypeExtension on DSIconButtonType {
  dynamic get image {
    switch (this) {
      case DSIconButtonType.apple:
        return Assets.images.icons.apple.svg();
      case DSIconButtonType.google:
        return Assets.images.icons.google.svg();
    }
  }

  dynamic get padding {
    switch (this) {
      case DSIconButtonType.apple:
        return EdgeInsets.zero;
      case DSIconButtonType.google:
        return EdgeInsets.all(DSSpacingV2.l);
    }
  }
}

class DSIconButton extends StatelessWidget {
  static const double _filledSize = 80;

  // MARK: - Properties
  final DSIconButtonType _type;
  final bool _isLoading;
  final void Function()? _onPressed;

  // MARK: - LifeCycle
  const DSIconButton({
    Key? key,
    required DSIconButtonType type,
    bool isLoading = false,
    void Function()? onPressed,
  })  : _type = type,
        _isLoading = isLoading,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed = _isLoading == true ? null : _onPressed;
    switch (_type) {
      case DSIconButtonType.apple:
        return _outlinedButtonSVGWidget(
          context: context,
          icon: DSIconButtonType.apple,
          onPressed: onPressed,
        );
      case DSIconButtonType.google:
        return _outlinedButtonSVGWidget(
          context: context,
          icon: DSIconButtonType.google,
          onPressed: onPressed,
        );
    }
  }

  Widget _outlinedButtonSVGWidget({
    required BuildContext context,
    required DSIconButtonType icon,
    required Function()? onPressed,
  }) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DSBorderRadiusV2.iconButton),
          side: BorderSide(color: DSColorV2.secondary30),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        padding: icon.padding,
        height: _filledSize,
        width: _filledSize,
        child: _getContent(
          child: icon.image,
        ),
      ),
    );
  }

  Widget _getContent({required Widget child}) {
    if (_isLoading) {
      return Center(
        child: SizedBox(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return child;
  }
}
