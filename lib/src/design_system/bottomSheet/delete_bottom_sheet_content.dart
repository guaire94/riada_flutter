import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/src/design_system/v2/component/buttons/ds_button_elevated_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/component/buttons/ds_button_outline_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/ds_bottom_sheet_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DeleteBottomSheetContent extends StatelessWidget {
  // MARK: - Properties
  final String _content;
  final Function _onYesPressed;

  // MARK: - Static
  static void show({
    required BuildContext context,
    required String title,
    required String content,
    required Function onYesPressed,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return DSBottomSheetV2(
          title: title,
          child: DeleteBottomSheetContent(
            content: content,
            onYesPressed: onYesPressed,
          ),
        );
      },
    );
  }

  // MARK: - Life cycle
  const DeleteBottomSheetContent({
    Key? key,
    required String content,
    required Function onYesPressed,
  })  : _content = content,
        _onYesPressed = onYesPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DSSpacingV2.m),
      child: Column(
        children: [
          Text(_content),
          SizedBox(height: DSSpacingV2.l),
          Row(
            children: [
              Expanded(
                child: DSButtonOutlineV2(
                  text: context.l10N.yes,
                  onPressed: () {
                    context.router.popForced();
                    _onYesPressed();
                  },
                ),
              ),
              SizedBox(width: DSSpacingV2.xs),
              Expanded(
                child: DSButtonElevatedV2(
                  text: context.l10N.no,
                  onPressed: () {
                    context.router.popForced();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
