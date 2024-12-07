import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/features/event/entity/event.dart';
import 'package:riada/src/features/event/entity/related_event.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:riada/src/utils/timestamp_extension.dart';

abstract class MarketplaceCarouselItem {
  String get id;
  late String Function(BuildContext) title;
  String get subtitle;
  String get image;

  DSListItem listItem(BuildContext context) {
    return _DSListItem(
      id: id,
      title: title(context),
      subtitle: subtitle,
      image: image,
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
  late String Function(BuildContext) title = (BuildContext context) {
    return context.l10N.marketplace_event_title(
      event.sportEmoticon,
      event.title,
    );
  };

  @override
  String get subtitle => event.date.shortDateDescription;

  @override
  String get image => "https://picsum.photos/600/300";
}

class ParticipateEventMarketplaceItem extends MarketplaceCarouselItem {
  final RelatedEvent event;

  ParticipateEventMarketplaceItem({
    required this.event,
  });

  @override
  String get id => event.eventId;

  @override
  late String Function(BuildContext) title = (BuildContext context) {
    return context.l10N.marketplace_calendar_event_participation_title(
      event.sportEmoticon,
      event.title,
    );
  };

  @override
  String get subtitle => event.date.dateAndHourDescription;

  @override
  String get image => "https://picsum.photos/600/300";
}

class OrganizeEventMarketplaceItem extends MarketplaceCarouselItem {
  final RelatedEvent event;

  OrganizeEventMarketplaceItem({
    required this.event,
  });

  @override
  String get id => event.eventId;

  @override
  late String Function(BuildContext) title = (BuildContext context) {
    return context.l10N.marketplace_calendar_event_organize_title(
      event.sportEmoticon,
      event.title,
    );
  };

  @override
  String get subtitle => event.date.dateAndHourDescription;

  @override
  String get image => "https://picsum.photos/600/300";
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

  _DSListItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });
}
