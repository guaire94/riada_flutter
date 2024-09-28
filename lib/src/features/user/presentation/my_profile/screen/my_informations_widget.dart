import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/image/ds_image_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class MyInformationsWidget extends StatelessWidget {
  final User user;

  const MyInformationsWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: DSSpacingV2.s),
      child: Row(
        children: [
          DSImageV2(
            type: DSImageTypeV2.smallAvatar,
            url: user.avatar,
          ),
          SizedBox(width: DSSpacingV2.s),
          Text(
            user.name,
            style: context.textTheme.displayLarge?.copyWith(
              color: DSColorV2.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
