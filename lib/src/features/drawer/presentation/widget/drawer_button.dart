import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

// Note: DrawerButton exits in Material
class CustomDrawerButton extends StatelessWidget {
  // MARK: - Constants
  static const double _height = 48;
  static const double _iconSize = 22;

  // MARK: - Properties
  final AssetGenImage _image;
  final String _text;
  final void Function()? _onPressed;

  // MARK: - LifeCycle
  const CustomDrawerButton({
    Key? key,
    required AssetGenImage image,
    required String text,
    void Function()? onPressed,
  })  : _image = image,
        _text = text,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSBorderRadiusV2.normal),
        color: DSColorV2.neutral35,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: DSSpacingV2.s,
      ),
      child: TextButton(
        onPressed: _onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _image.image(
              height: _iconSize,
              width: _iconSize,
            ),
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
    );
  }
}
