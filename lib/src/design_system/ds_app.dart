import 'package:riada/gen/fonts.gen.dart';
import 'package:riada/l10n/app_localizations.dart';
import 'package:riada/src/design_system/buttons/ds_button_elevated.dart';
import 'package:riada/src/design_system/buttons/ds_button_outline.dart';
import 'package:riada/src/design_system/buttons/ds_button_text.dart';
import 'package:riada/src/design_system/datePicker/ds_date_picker_controller.dart';
import 'package:riada/src/design_system/datePicker/ds_date_picker_field.dart';
import 'package:riada/src/design_system/datePicker/ds_year_picker_controller.dart';
import 'package:riada/src/design_system/datePicker/ds_year_picker_field.dart';
import 'package:riada/src/design_system/dropdown/ds_dropdown.dart';
import 'package:riada/src/design_system/ds_bottom_sheet.dart';
import 'package:riada/src/design_system/ds_color.dart';
import 'package:riada/src/design_system/ds_icon_button.dart';
import 'package:riada/src/design_system/ds_image.dart';
import 'package:riada/src/design_system/ds_image_picker.dart';
import 'package:riada/src/design_system/ds_image_picker_controller.dart';
import 'package:riada/src/design_system/ds_image_type.dart';
import 'package:riada/src/design_system/ds_spacing.dart';
import 'package:riada/src/design_system/ds_text_field.dart';
import 'package:riada/src/design_system/radioList/ds_radio_list.dart';
import 'package:riada/src/design_system/segment/ds_segment.dart';
import 'package:riada/src/design_system/segment/ds_segment_controller.dart';
import 'package:riada/src/design_system/segment/ds_segment_item.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_theme_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DSApp extends StatefulWidget {
  const DSApp({Key? key}) : super(key: key);

  @override
  _DSAppState createState() => _DSAppState();
}

class _DSAppState extends State<DSApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Design System",
      theme: dsThemeV2(),
      home: MyDesignSystemScreen(),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
    );
  }
}

class MyDesignSystemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColor.neutral35,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Text variations",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Display large',
                    style: context.textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Display Medium',
                    style: context.textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Display small',
                    style: context.textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Headline large',
                    style: context.textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Headline medium',
                    style: context.textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Body large',
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Title large',
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Body medium',
                    style: context.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Title medium',
                    style: context.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Text(
                    'Body small',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
              Divider(),
              Text(
                "Color",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColor.neutral100,
                        child: Text(
                          'Neutral 100',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: DSSpacing.sizeXxxs,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColor.neutral70,
                        child: Text(
                          'Neutral 70',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: DSSpacing.sizeXxxs,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColor.neutral35,
                        child: Text(
                          'Neutral 35',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: DSSpacing.sizeXxxs,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColor.neutral10,
                        child: Text(
                          'Neutral 35',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: DSColor.primary100,
                    child: Text(
                      'Primary 100',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: DSSpacing.sizeXxxs,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColor.success100,
                        child: Text(
                          'Success 100',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: DSSpacing.sizeXxxs,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColor.danger100,
                        child: Text(
                          'Danger 100',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: DSSpacing.sizeXxxs,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: DSColor.alert100,
                        child: Text(
                          'Alert 100',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Button',
                      style: context.textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: DSSpacing.sizeM,
                    ),
                    Column(
                      children: [
                        DSButtonElevated(
                          onPressed: () => {},
                          text: 'Default',
                        ),
                        DSButtonOutline(
                          onPressed: () => {},
                          text: 'Outline',
                        ),
                        DSButtonText(
                          onPressed: () => {},
                          text: 'Text',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Button Icon',
                      style: context.textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: DSSpacing.sizeM,
                    ),
                    Column(
                      children: [
                        DSIconButton(
                          type: DSIconButtonType.apple,
                          onPressed: () => {},
                        ),
                        SizedBox(
                          height: DSSpacing.sizeXs,
                        ),
                        DSIconButton(
                          type: DSIconButtonType.google,
                          onPressed: () => {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Text field',
                      style: context.textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: DSSpacing.sizeM,
                    ),
                    DSTextField(
                      hintText: 'hintText',
                      label: 'Label',
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bottom Sheet',
                      style: context.textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: DSSpacing.sizeM,
                    ),
                    DSButtonElevated(
                      onPressed: () => _showModalBottomSheet(context),
                      text: 'Open',
                      // textStyle: null,
                      // height: 40,
                    ),
                  ],
                ),
              ),
              Divider(),
              Text(
                "Image picker variations",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DSImagePicker(
                            type: DSImageType.medium,
                            controller: DSImagePickerController(),
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImagePicker(
                            type: DSImageType.medium,
                            controller: DSImagePickerController(),
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImagePicker(
                            type: DSImageType.medium,
                            controller: DSImagePickerController(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Image variations",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DSImage(
                            type: DSImageType.medium,
                            url: "https://picsum.photos/100/100",
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImage(
                            type: DSImageType.medium,
                            url: "https://picsum.photos/100/100",
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImage(
                            type: DSImageType.medium,
                            url: "https://picsum.photos/100/100",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DSImage(
                            type: DSImageType.small,
                            url: "https://picsum.photos/60/60",
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImage(
                            type: DSImageType.small,
                            url: "https://picsum.photos/60/60",
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImage(
                            type: DSImageType.small,
                            url: "https://picsum.photos/60/60",
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImage(
                            type: DSImageType.small,
                            url: "https://picsum.photos/60/60",
                          ),
                        ),
                        SizedBox(
                          width: DSSpacing.sizeS,
                        ),
                        Expanded(
                          child: DSImage(
                            type: DSImageType.small,
                            url: "https://picsum.photos/60/60",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Dropdown",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              Container(
                padding: EdgeInsets.all(DSSpacing.sizeS),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DSDropdown(
                      label: "Empty dropdown (Object with remote key)",
                      controller: DSDropdownController(items: [
                        // TODO: introduce non empty dropdown example
                      ]),
                    ),
                  ],
                ),
              ),
              Text(
                "Segments",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              DSSegment(
                controller: DSSegmentController(
                  items: [
                    ItemSegmentContent(SegmentItems.item1),
                    ItemSegmentContent(SegmentItems.item2),
                  ],
                  selectItem: ItemSegmentContent(SegmentItems.item1),
                ),
                title: "2 items:",
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              DSSegment(
                controller: DSSegmentController(
                  items: SegmentItems.values
                      .map((e) => ItemSegmentContent(e))
                      .toList(),
                  selectItem: ItemSegmentContent(SegmentItems.item1),
                ),
                title: "4 items:",
              ),
              Text(
                "Date pickers",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              DSYearPickerTextField(
                label: "Year picker",
                controller: DSYearPickerController(),
              ),
              SizedBox(
                height: DSSpacing.sizeM,
              ),
              DSDatePickerTextField(
                label: "Date picker",
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                initialDate: DateTime.now(),
                controller: DSDatePickerController(),
              ),
              SizedBox(height: DSSpacing.sizeM),
              Text(
                "Radio List",
                style: TextStyle(
                  fontFamily: FontFamily.poppins,
                  fontSize: 36,
                  color: DSColor.primary100,
                ),
              ),
              SizedBox(height: DSSpacing.sizeM),
              DSRadioList(
                controller: DSRadioListController(
                  title: "Radio List",
                  items: SegmentItems.values
                      .map((e) => RadioListContent(e))
                      .toList(),
                  selectedIndex: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return DSBottomSheet(title: 'I\'m a title', child: Text('Hello'));
    },
  );
}

enum SegmentItems { item1, item2, item3, item4 }

class ItemSegmentContent implements DSSegmentContent {
  final SegmentItems item;

  ItemSegmentContent(this.item);

  @override
  String get content {
    return item.name;
  }
}

class RadioListContent implements DSRadioListItem {
  final SegmentItems item;

  RadioListContent(this.item);

  String radioItemLeadingText(BuildContext context) {
    return item.name;
  }

  String radioItemTrailingText(BuildContext context) {
    return "1,000 AED";
  }
}
