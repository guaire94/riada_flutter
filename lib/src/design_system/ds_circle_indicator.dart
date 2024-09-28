import 'package:flutter/material.dart';
import 'package:template_flutter_app/src/design_system/ds_color.dart';
import 'package:template_flutter_app/src/design_system/ds_spacing.dart';

class DSCircleIndicator extends StatelessWidget {
  final double _size;
  final double _strokeWidth;

  const DSCircleIndicator({
    Key? key,
    required double size,
    double strokeWidth = 4.0,
  })  : _size = size,
        _strokeWidth = strokeWidth,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_size / 2),
        color: DSColor.black20,
      ),
      padding: EdgeInsets.all(DSSpacing.sizeXxs),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: _strokeWidth,
          color: Colors.white,
        ),
      ),
    );
  }
}
