import 'package:template_flutter_app/src/design_system/v2/ds_bottom_sheet_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_button_screen.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_color_screen.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_image_screen.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_input_screen.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_list_carousel_screen.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_list_long_grid_screen.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_list_small_grid_screen.dart';
import 'package:template_flutter_app/src/design_system/v2/screen/ds_text_variation_screen.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

enum DSAppListItem {
  textVariation,
  color,
  button,
  image,
  input,
  listSmallGrid,
  listLongGrid,
  listCarousel,
  bottomSheet,
}

class DSAppListViewItem extends StatelessWidget {
  final DSAppListItem item;

  DSAppListViewItem(this.item);

  @override
  Widget build(BuildContext context) {
    String title;
    void Function()? onTap;
    switch (item) {
      case DSAppListItem.textVariation:
        title = "Text variations";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSTextVariationScreen()),
          );
        };
        break;
      case DSAppListItem.color:
        title = "Colors";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSColorScreen()),
          );
        };
        break;
      case DSAppListItem.button:
        title = "Buttons";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSButtonScreen()),
          );
        };
        break;
      case DSAppListItem.image:
        title = "Image";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSImageScreen()),
          );
        };
        break;
      case DSAppListItem.input:
        title = "Input";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSInputScreen()),
          );
        };
        break;
      case DSAppListItem.listLongGrid:
        title = "List - Long Grid";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSListLongGridScreen()),
          );
        };
        break;
      case DSAppListItem.listSmallGrid:
        title = "List - Small Grid";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSListSmallGridScreen()),
          );
        };
        break;
      case DSAppListItem.listCarousel:
        title = "List - Carousel";
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DSListCarouselScreen()),
          );
        };
        break;
      case DSAppListItem.bottomSheet:
        title = "Bottom sheet";
        onTap = () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return DSBottomSheetV2(
                title: 'I\'m a title',
                child: Text('Hello'),
              );
            },
          );
        };
        break;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DSSpacingV2.xl,
          vertical: DSSpacingV2.m,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.headlineLarge?.copyWith(
                color: DSColorV2.primary,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: DSSpacingV2.s),
          ],
        ),
      ),
    );
  }
}
