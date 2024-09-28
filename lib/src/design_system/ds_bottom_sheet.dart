import 'package:flutter/material.dart';
import 'package:template_flutter_app/src/design_system/ds_border_radius.dart';
import 'package:template_flutter_app/src/design_system/ds_spacing.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';

class DSBottomSheet extends StatelessWidget {
  final Widget _child;
  final String _title;

  const DSBottomSheet({
    Key? key,
    required Widget child,
    required String title,
  })  : _child = child,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(DSSpacing.sizeS),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(DSBorderRadius.normal),
            topRight: Radius.circular(DSBorderRadius.normal),
          ),
        ),
        child: Column(
          children: [
            Text(
              _title,
              style: context.textTheme.displayMedium,
            ),
            SizedBox(height: DSSpacing.sizeS),
            _child,
          ],
        ),
      ),
    );
  }
}
