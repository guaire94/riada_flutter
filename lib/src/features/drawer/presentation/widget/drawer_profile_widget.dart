import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/features/user/entity/user.dart';
import 'package:riada/src/utils/build_context_extension.dart';

class DrawerProfileWidget extends StatelessWidget {
  // MARK: - Constants
  static const _height = 150.0;
  static const _guestImage = "https://picsum.photos/id/18/72/72.jpg";

  // MARK: - Properties
  final User? _user;

  // MARK: - Life cycle
  const DrawerProfileWidget({
    Key? key,
    required User? user,
  })  : _user = user,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: _content(context),
    );
  }

  // MARK: - Private
  Widget _content(BuildContext context) {
    return Column(
      children: [
        Container(
          height: DSImageTypeV2.avatar.height,
          width: DSImageTypeV2.avatar.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: DSImageTypeV2.avatar.borderRadius,
            border: Border.all(width: 4, color: DSColorV2.primary),
          ),
          child: DSImageV2(
            type: DSImageTypeV2.avatar,
            url: _user != null ? _user.avatar : _guestImage,
          ),
        ),
        SizedBox(height: DSSpacingV2.xs),
        Text(
          _user != null ? _user.nickName : context.l10N.drawer_guest,
          style: context.textTheme.headlineLarge?.copyWith(
            color: DSColorV2.secondary,
          ),
        ),
      ],
    );
  }
}
