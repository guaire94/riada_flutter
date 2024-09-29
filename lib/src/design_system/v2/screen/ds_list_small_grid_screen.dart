import 'package:riada/gen/fonts.gen.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:flutter/material.dart';

class DSListSmallGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      20,
      (index) => DSListItemExample(
        id: "$index",
        title: "Service",
        subtitle: "$index AED",
        image: "https://picsum.photos/${168 + index}/${152 + index}",
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List - Small Grid",
          style: TextStyle(
            fontFamily: FontFamily.rufina,
            fontSize: 36,
            color: DSColorV2.primary,
          ),
        ),
      ),
      backgroundColor: DSColorV2.neutral35,
      body: DSListView(
        type: DSListViewType.smallGrid,
        title: 'Dernieres prestations',
        items: items,
        onTap: (_) {},
        onRefresh: () async {},
      ),
    );
  }
}

class DSListItemExample implements DSListItem {
  @override
  String id;
  @override
  String title;
  @override
  String subtitle;
  @override
  String image;
  @override
  String? rightTopCornerText;

  DSListItemExample({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    this.rightTopCornerText,
  });
}
