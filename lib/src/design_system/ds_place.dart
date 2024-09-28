import 'package:template_flutter_app/src/design_system/ds_size.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSPlace extends StatelessWidget {
  final String _place;

  const DSPlace({
    super.key,
    required String place,
  }) : _place = place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.place_outlined,
          size: DSSize.inputIcon,
          color: Colors.black,
        ),
        SizedBox(width: DSSpacingV2.xxs),
        Expanded(
          child: Text(
            _place,
            style: context.textTheme.bodyLarge?.copyWith(
              color: DSColorV2.secondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
