import 'package:flutter/widgets.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/features/event/entity/event.dart';

class EventListItem implements DSListItem {
  @override
  String id;
  @override
  String title;
  @override
  String subtitle;
  @override
  String image;

  EventListItem({
    required Event event,
    required BuildContext context,
  })  : id = event.id,
        title = event.title,
        subtitle = event.description,
        image = event.sportEmoticon;
}
