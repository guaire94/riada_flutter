import 'package:riada/src/design_system/ds_color.dart';
import 'package:riada/src/utils/build_context_extension.dart';
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
