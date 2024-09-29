import 'package:riada/gen/assets.gen.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  // MARK: - Constants
  static const double _logoWidth = 46;
  // MARK: - Dependencies
  final int _activeIndex;
  final String _title;
  final Color _color;
  final void Function() _onDrawerTapped;

  // MARK: - LifeCycle
  const DSHomeAppBar({
    Key? key,
    required int activeIndex,
    required String title,
    required Color color,
    required void Function() onDrawerTapped,
  })  : _activeIndex = activeIndex,
        _title = title,
        _color = color,
        _onDrawerTapped = onDrawerTapped,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: DSSpacingV2.s,
        right: DSSpacingV2.s,
        bottom: DSSpacingV2.s,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_activeIndex != 0) SizedBox(),
          if (_activeIndex == 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: _logoWidth,
                  child: Assets.images.icons.v2.logoCircular.image(),
                ),
                SizedBox(width: DSSpacingV2.xxs),
                Text(
                  _title,
                  style: context.textTheme.displayLarge?.copyWith(
                    color: DSColorV2.secondary,
                  ),
                ),
              ],
            ),
          _getDrawerButton(),
        ],
      ),
    );
  }

  // MARK: - Privates

  Widget _getDrawerButton() {
    return InkWell(
      onTap: _onDrawerTapped,
      child: Assets.images.icons.v2.drawer.svg(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
