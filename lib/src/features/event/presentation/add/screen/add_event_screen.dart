import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/common/presentation/common/loading_widget.dart';
import 'package:riada/src/features/event/presentation/add/bloc/add_event_bloc.dart';
import 'package:riada/src/features/event/presentation/add/screen/add_event_idle_widget.dart';

@RoutePage()
class AddEventScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<AddEventBloc>(),
      child: this,
    );
  }
}

class _AddEventScreenState extends BaseState<AddEventScreen, AddEventBloc> {
  // MARK: - Life cycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEventBloc, AddEventState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(AddEventState previous, AddEventState current) {
    return current is LoadingState || current is IdleState;
  }

  bool _listenWhen(AddEventState previous, AddEventState current) {
    return current is SuccessState;
  }

  Function(BuildContext, AddEventState) _onStateChangeListener() {
    return (context, state) {
      if (state is SuccessState) {
        context.router.popForced();
      }
    };
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    AddEventState state,
  ) {
    if (state is IdleState) {
      return AddEventIdleWidget(
        state: state,
        bloc: bloc,
      );
    }

    if (state is LoadingState) {
      return LoadingWidget();
    }

    return Container();
  }

  // MARK: - Privates
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
