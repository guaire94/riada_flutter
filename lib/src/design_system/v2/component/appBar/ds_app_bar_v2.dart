import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSAppBarV2 extends StatelessWidget implements PreferredSizeWidget {
  // MARK: - Privates
  static const double _iconHeight = 24;
  static const double _iconWidth = 16;

  // MARK: - Properties
  final String? _title;
  final bool _canGoBack;
  final void Function()? _additionalBackAction;

  const DSAppBarV2(
      {Key? key,
      String? title,
      bool canGoBack = true,
      void Function()? additionalBackAction = null})
      : _title = title,
        _canGoBack = canGoBack,
        _additionalBackAction = additionalBackAction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: _titleWidget(context: context),
        leading: _leadingWidget(context),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  Widget? _leadingWidget(BuildContext context) {
    if (_canGoBack == true) {
      return Container(
        padding: EdgeInsets.only(
          left: DSSpacingV2.s,
        ),
        child: InkWell(
          onTap: () {
            if (_additionalBackAction != null) _additionalBackAction();
            context.router.popForced();
          },
          child: Center(
            child: Assets.images.icons.v2.backButton.svg(
              width: _iconWidth,
              height: _iconHeight,
            ),
          ),
        ),
      );
    }

    return null;
  }

  Widget? _titleWidget({
    required BuildContext context,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_title != null)
          Text(
            _title,
            style: context.textTheme.headlineLarge?.copyWith(
              color: DSColorV2.secondary,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
