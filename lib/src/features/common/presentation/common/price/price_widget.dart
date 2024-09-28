import 'package:template_flutter_app/src/design_system/ds_color.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  // MARK: - Properties
  final String price;

  PriceWidget({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: context.textTheme.headlineLarge?.copyWith(
        color: DSColor.primary100,
      ),
    );
  }
}
