import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSBottomSheetV2 extends StatelessWidget {
  final Widget _child;
  final String _title;

  const DSBottomSheetV2({
    Key? key,
    required Widget child,
    required String title,
  })  : _child = child,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(DSSpacingV2.s),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(DSBorderRadiusV2.normal),
              topRight: Radius.circular(DSBorderRadiusV2.normal),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: context.textTheme.headlineLarge,
              ),
              SizedBox(height: DSSpacingV2.s),
              _child,
            ],
          ),
        ),
      ),
    );
  }
}
