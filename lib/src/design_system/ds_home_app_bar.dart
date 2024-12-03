import 'package:flutter/material.dart';
import 'package:riada/gen/assets.gen.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';

class DSHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  // MARK: - Constants
  final void Function() _onDrawerTapped;

  // MARK: - LifeCycle
  const DSHomeAppBar({
    Key? key,
    required void Function() onDrawerTapped,
  })  : _onDrawerTapped = onDrawerTapped,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: DSSpacingV2.s,
        right: DSSpacingV2.s,
        bottom: DSSpacingV2.s,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _getDrawerButton(),
        ],
      ),
    );
  }

  // MARK: - Privates

  Widget _getDrawerButton() {
    return InkWell(
      onTap: _onDrawerTapped,
      child: Assets.icons.account.svg(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
