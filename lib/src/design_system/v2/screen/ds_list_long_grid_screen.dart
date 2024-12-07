import 'package:flutter/material.dart';
import 'package:riada/gen/fonts.gen.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';

class DSListLongGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      20,
      (index) => DSListItemExample(
        id: "$index",
        title: "Event $index",
        subtitle: "Dubai",
        image: "https://picsum.photos/${136 + index}/${300 + index}",
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List - Long Grid",
          style: TextStyle(
            fontFamily: FontFamily.rufina,
            fontSize: 36,
            color: DSColorV2.primary,
          ),
        ),
      ),
      backgroundColor: DSColorV2.neutral35,
      body: DSListView(
        type: DSListViewType.longGrid,
        title: 'Prochain évènements',
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

  DSListItemExample({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });
}
