import 'package:riada/src/design_system/ds_size.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:riada/src/utils/timestamp_extension.dart';
import 'package:flutter/material.dart';

class DSDate extends StatelessWidget {
  final DateTime _date;

  const DSDate({
    super.key,
    required DateTime date,
  }) : _date = date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: DSSize.buttonIcon,
          color: Colors.black,
        ),
        SizedBox(width: DSSpacingV2.xxs),
        Text(
          _date.fullDateDescription,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
