import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:flutter/material.dart';

class DSDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DSSpacingV2.s),
      child: Container(
        color: DSColorV2.neutral35,
        height: 1,
      ),
    );
  }
}
