import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/features/event/presentation/common/item/event_list_item.dart';
import 'package:riada/src/features/event/presentation/list/bloc/event_list_bloc.dart';
import 'package:riada/src/router/routes.gr.dart';

class ListIdleWidget extends StatefulWidget {
  // MARK: - Dependencies
  final IdleState _state;
  final Future<void> Function() _onRefresh;
  // MARK: - Life cycle
  const ListIdleWidget({
    Key? key,
    required IdleState state,
    required Future<void> Function() onRefresh,
  })  : _state = state,
        _onRefresh = onRefresh,
        super(key: key);

  @override
  State<ListIdleWidget> createState() => _ListIdleWidgetState();
}

class _ListIdleWidgetState extends State<ListIdleWidget> {
  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DSListView(
            type: DSListViewType.smallGrid,
            title: "List",
            items: _eventListItems(),
            onTap: (item) {
              context.pushRoute(EventDetailsRoute(eventId: item.id));
            },
            onRefresh: widget._onRefresh,
          ),
        ),
      ],
    );
  }

  // MARK: - Private
  List<EventListItem> _eventListItems() {
    return widget._state.events
        .map(
          (event) => EventListItem(
            event: event,
            context: context,
          ),
        )
        .toList();
  }
}
