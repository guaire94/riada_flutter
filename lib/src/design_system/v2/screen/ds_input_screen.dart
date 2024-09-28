import 'package:template_flutter_app/gen/fonts.gen.dart';
import 'package:template_flutter_app/src/design_system/datePicker/ds_date_picker_controller.dart';
import 'package:template_flutter_app/src/design_system/datePicker/ds_date_picker_field.dart';
import 'package:template_flutter_app/src/design_system/datePicker/ds_time_picker_controller.dart';
import 'package:template_flutter_app/src/design_system/datePicker/ds_time_picker_field.dart';
import 'package:template_flutter_app/src/design_system/datePicker/ds_year_picker_controller.dart';
import 'package:template_flutter_app/src/design_system/datePicker/ds_year_picker_field.dart';
import 'package:template_flutter_app/src/design_system/dropdown/ds_dropdown.dart';
import 'package:template_flutter_app/src/design_system/ds_text_field.dart';
import 'package:template_flutter_app/src/design_system/radioList/ds_radio_list.dart';
import 'package:template_flutter_app/src/design_system/segment/ds_segment.dart';
import 'package:template_flutter_app/src/design_system/segment/ds_segment_controller.dart';
import 'package:template_flutter_app/src/design_system/segment/ds_segment_item.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class DSInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input",
          style: TextStyle(
            fontFamily: FontFamily.rufina,
            fontSize: 36,
            color: DSColorV2.primary,
          ),
        ),
      ),
      backgroundColor: DSColorV2.neutral35,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(DSSpacingV2.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Text field',
                      style: context.textTheme.displayLarge,
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    DSTextField(
                      hintText: 'hintText',
                      label: 'Label',
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      "Dropdown",
                      style: TextStyle(
                        fontFamily: FontFamily.rufina,
                        fontSize: 36,
                        color: DSColorV2.primary,
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Container(
                      padding: EdgeInsets.all(DSSpacingV2.s),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DSDropdown(
                            label: "Dropdown",
                            controller: DSDropdownController(items: [
                              _HorsePaperDropdownContent(false),
                              _HorsePaperDropdownContent(true),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      "Segments",
                      style: TextStyle(
                        fontFamily: FontFamily.rufina,
                        fontSize: 36,
                        color: DSColorV2.primary,
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    DSSegment(
                      controller: DSSegmentController(
                        items: [
                          _ItemSegmentContent(_SegmentItems.item1),
                          _ItemSegmentContent(_SegmentItems.item2),
                        ],
                        selectItem: _ItemSegmentContent(_SegmentItems.item1),
                      ),
                      title: "2 items:",
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    DSSegment(
                      controller: DSSegmentController(
                        items: _SegmentItems.values
                            .map((e) => _ItemSegmentContent(e))
                            .toList(),
                        selectItem: _ItemSegmentContent(_SegmentItems.item1),
                      ),
                      title: "4 items:",
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      "Date pickers",
                      style: TextStyle(
                        fontFamily: FontFamily.rufina,
                        fontSize: 36,
                        color: DSColorV2.primary,
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    DSYearPickerTextField(
                      label: "Year picker",
                      controller: DSYearPickerController(),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    DSDatePickerTextField(
                      label: "Date picker",
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
                      controller: DSDatePickerController(),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    DSTimePickerTextField(
                      label: "Time",
                      controller: DSTimePickerController(),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    Text(
                      "Radio List",
                      style: TextStyle(
                        fontFamily: FontFamily.rufina,
                        fontSize: 36,
                        color: DSColorV2.primary,
                      ),
                    ),
                    SizedBox(height: DSSpacingV2.m),
                    DSRadioList(
                      controller: DSRadioListController(
                        title: "Radio List",
                        items: _SegmentItems.values
                            .map((e) => _RadioListContent(e))
                            .toList(),
                        selectedIndex: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _SegmentItems { item1, item2, item3, item4 }

class _ItemSegmentContent implements DSSegmentContent {
  final _SegmentItems item;

  _ItemSegmentContent(this.item);

  @override
  String get content {
    return item.name;
  }
}

class _RadioListContent implements DSRadioListItem {
  final _SegmentItems item;

  _RadioListContent(this.item);

  String radioItemLeadingText(BuildContext context) {
    return item.name;
  }

  String radioItemTrailingText(BuildContext context) {
    return "1,000 AED";
  }
}

class _HorsePaperDropdownContent implements DSDropdownItem {
  final bool havePaper;

  _HorsePaperDropdownContent(this.havePaper);

  @override
  String dropDownMenuItemName(BuildContext context) {
    if (havePaper) {
      return context.l10N.yes;
    } else {
      return context.l10N.no;
    }
  }
}
