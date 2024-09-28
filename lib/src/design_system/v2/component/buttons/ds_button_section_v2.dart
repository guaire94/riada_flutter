import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

enum DSButtonSectionType { medium, small }

class DSButtonSectionV2 extends StatelessWidget {
  // MARK: - Properties
  final DSButtonSectionType _type;
  final AssetGenImage _image;
  final String _text;
  final void Function()? _onPressed;

  // MARK: - LifeCycle
  const DSButtonSectionV2({
    Key? key,
    required DSButtonSectionType type,
    required AssetGenImage image,
    required String text,
    void Function()? onPressed,
  })  : _type = type,
        _image = image,
        _text = text,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DSSpacingV2.l),
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DSBorderRadiusV2.normal),
          color: DSColorV2.neutral10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: DSSpacingV2.s,
        ),
        child: TextButton(
          onPressed: _onPressed,
          child: Row(
            mainAxisAlignment: _alignment,
            children: [
              _imageContent(),
              SizedBox(width: DSSpacingV2.xs),
              Text(
                _text,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: DSColorV2.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // MARK: - Private
  double get _height {
    switch (_type) {
      case DSButtonSectionType.medium:
        return 70;
      case DSButtonSectionType.small:
        return 48;
    }
  }

  MainAxisAlignment get _alignment {
    switch (_type) {
      case DSButtonSectionType.medium:
        return MainAxisAlignment.center;
      case DSButtonSectionType.small:
        return MainAxisAlignment.start;
    }
  }

  Widget _imageContent() {
    switch (_type) {
      case DSButtonSectionType.medium:
        final double iconBackgrounSize = 32;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
            color: DSColorV2.primary,
          ),
          height: iconBackgrounSize,
          width: iconBackgrounSize,
          child: _image.image(
            height: _iconSize,
            width: _iconSize,
          ),
        );
      case DSButtonSectionType.small:
        return _image.image(
          height: _iconSize,
          width: _iconSize,
        );
    }
  }

  double get _iconSize {
    switch (_type) {
      case DSButtonSectionType.medium:
        return 30;
      case DSButtonSectionType.small:
        return 22;
    }
  }
}
