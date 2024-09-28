import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/src/factory/di.dart';
import 'package:template_flutter_app/src/features/common/presentation/base/base_state.dart';
import 'package:template_flutter_app/src/features/list/presentation/list/bloc/list_bloc.dart';
import 'package:template_flutter_app/src/features/list/presentation/list/screen/list_empty_widget.dart';
import 'package:template_flutter_app/src/features/list/presentation/list/screen/list_error_widget.dart';
import 'package:template_flutter_app/src/features/list/presentation/list/screen/list_idle_widget.dart';
import 'package:template_flutter_app/src/features/list/presentation/list/screen/list_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ListScreen extends StatefulWidget implements AutoRouteWrapper {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<ListBloc>(),
      child: this,
    );
  }
}

class _ListScreenState extends BaseState<ListScreen, ListBloc> {
  // MARK: - Life cycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(
      buildWhen: _buildWhen,
      builder: _onStateChangeBuilder,
    );
  }

  bool _buildWhen(ListState previous, ListState current) {
    return current is LoadingState ||
        current is IdleState ||
        current is EmptyState ||
        current is ErrorState;
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    ListState state,
  ) {
    if (state is LoadingState) {
      return ListLoadingWidget();
    } else if (state is IdleState) {
      return ListIdleWidget(
        state: state,
        onRefresh: onRefresh,
      );
    } else if (state is EmptyState) {
      return ListEmptyWidget(
        state: state,
      );
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
