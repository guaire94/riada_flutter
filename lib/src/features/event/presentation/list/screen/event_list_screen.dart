import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/event/presentation/list/bloc/event_list_bloc.dart';
import 'package:riada/src/features/common/presentation/common/list/list_empty_widget.dart';
import 'package:riada/src/features/common/presentation/common/list/list_error_widget.dart';
import 'package:riada/src/features/event/presentation/list/screen/event_list_idle_widget.dart';
import 'package:riada/src/features/common/presentation/common/list/list_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EventListScreen extends StatefulWidget implements AutoRouteWrapper {
  const EventListScreen({Key? key}) : super(key: key);

  @override
  State<EventListScreen> createState() => _EventListScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<EventListBloc>(),
      child: this,
    );
  }
}

class _EventListScreenState extends BaseState<EventListScreen, EventListBloc> {
  // MARK: - Life cycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventListBloc, EventListState>(
      buildWhen: _buildWhen,
      builder: _onStateChangeBuilder,
    );
  }

  bool _buildWhen(EventListState previous, EventListState current) {
    return current is LoadingState ||
        current is IdleState ||
        current is EmptyState ||
        current is ErrorState;
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    EventListState state,
  ) {
    if (state is LoadingState) {
      return ListLoadingWidget(
        title: "List",
        type: DSListViewType.smallGrid,
      );
    } else if (state is IdleState) {
      return ListIdleWidget(
        state: state,
        onRefresh: onRefresh,
      );
    } else if (state is EmptyState) {
      return ListEmptyWidget();
    } else if (state is ErrorState) {
      return ListErrorWidget();
    }
    return Container();
  }

  // MARK: - Privates
  Future<void> onRefresh() async {
    bloc.add(RefreshEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
