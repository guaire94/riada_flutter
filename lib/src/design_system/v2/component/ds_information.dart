import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DSInformationItem extends StatelessWidget {
  // MARK: Dependencies
  final SvgPicture icon;
  final String title;

  // MARK: LifeCycle
  const DSInformationItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: DSSpacingV2.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: DSSpacingV2.s),
            width: DSSpacingV2.s,
            child: icon,
          ),
          Flexible(
            child: Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                color: DSColorV2.secondary,
              ),
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
