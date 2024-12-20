import 'package:flutter/material.dart';
import 'package:riada/gen/fonts.gen.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';

class DSListCarouselScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final horses = List.generate(
      5,
      (index) => _DSListItemExample(
        id: "$index",
        title: "Horse",
        subtitle: "$index AED",
        image: "https://picsum.photos/${184 + index}/${168 + index}",
      ),
    );

    final events = List.generate(
      5,
      (index) => _DSListItemExample(
        id: "$index",
        title: "Event",
        subtitle: "$index AED",
        image: "https://picsum.photos/${136 + index}/${300 + index}",
      ),
    );

    final services = List.generate(
      5,
      (index) => _DSListItemExample(
        id: "$index",
        title: "Service",
        subtitle: "$index AED",
        image: "https://picsum.photos/${152 + index}/${136 + index}",
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List - Carousel",
          style: TextStyle(
            fontFamily: FontFamily.rufina,
            fontSize: 36,
            color: DSColorV2.primary,
          ),
        ),
      ),
      backgroundColor: DSColorV2.neutral35,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: DSListViewType.largeCarousel.height,
              child: DSListView(
                type: DSListViewType.largeCarousel,
                title: 'Large Carousel',
                items: horses,
                onTap: (_) {},
                onRefresh: () async {},
              ),
            ),
            Container(
              height: DSListViewType.longCarousel.height,
              child: DSListView(
                type: DSListViewType.longCarousel,
                title: 'Long Carousel',
                items: events,
                onTap: (_) {},
                onRefresh: () async {},
              ),
            ),
            Container(
              height: DSListViewType.smallCarousel.height,
              child: DSListView(
                type: DSListViewType.smallCarousel,
                title: 'Small Carousel',
                items: services,
                onTap: (_) {},
                onRefresh: () async {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DSListItemExample implements DSListItem {
  @override
  String id;
  @override
  String title;
  @override
  String subtitle;
  @override
  String image;

  _DSListItemExample({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });
}
