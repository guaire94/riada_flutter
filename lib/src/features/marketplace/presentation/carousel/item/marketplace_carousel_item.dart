import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/utils/timestamp_extension.dart';
import 'package:flutter/material.dart';

abstract class MarketplaceCarouselItem {
  String get id;
  String get title;
  String get subtitle;
  String get image;
  DateTime? get date;

  DSListItem listItem(BuildContext context) {
    String? rightTopCornerText;
    if (date != null) {
      rightTopCornerText = date!.dateDescription;
    }
    return _DSListItem(
      id: id,
      title: title,
      subtitle: subtitle,
      image: image,
      rightTopCornerText: rightTopCornerText,
    );
  }
}

class EventMarketplaceItem extends MarketplaceCarouselItem {
  final Event event;

  EventMarketplaceItem({
    required this.event,
  });

  @override
  String get id => event.id;

  @override
  String get title => event.title;

  @override
  String get subtitle => event.description;

  @override
  DateTime? get date => null;

  @override
  String get image => "https://picsum.photos/700/300";
}

class _DSListItem implements DSListItem {
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

  _DSListItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    this.rightTopCornerText,
  });
}
