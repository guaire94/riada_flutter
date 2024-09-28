import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/ds_color.dart';
import 'package:template_flutter_app/src/design_system/ds_spacing.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? _title;
  final bool _canGoBack;
  final void Function()? _additionalBackAction;

  const DSAppBar(
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
          top: DSSpacing.sizeXxxs,
          left: DSSpacing.sizeS,
        ),
        child: InkWell(
          onTap: () {
            if (_additionalBackAction != null) _additionalBackAction();
            context.router.popForced();
          },
          child: Assets.images.icons.backButton.svg(),
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
            style: context.textTheme.displaySmall?.copyWith(
              color: DSColor.primary100,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
