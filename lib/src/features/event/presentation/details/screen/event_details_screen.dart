import 'package:auto_route/auto_route.dart';
import 'package:riada/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/common/presentation/common/loading_widget.dart';
import 'package:riada/src/features/event/presentation/details/bloc/event_details_bloc.dart';
import 'package:riada/src/features/event/presentation/details/screen/event_details_widget.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:riada/src/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class EventDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  // MARK: - Dependencies
  final String _eventId;

  // MARK: - LifeCycle
  const EventDetailsScreen({
    Key? key,
    required String eventId,
  })  : _eventId = eventId,
        super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<EventDetailsBloc>(),
      child: this,
    );
  }
}

class _EventDetailsScreenState
    extends BaseState<EventDetailsScreen, EventDetailsBloc> {
  // MARK: - Life cycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent(eventId: widget._eventId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventDetailsBloc, EventDetailsState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(EventDetailsState previous, EventDetailsState current) {
    return current is LoadingState ||
        current is IdleState ||
        current is ErrorState;
  }

  bool _listenWhen(EventDetailsState previous, EventDetailsState current) {
    return current is ErrorState;
  }

  Function(BuildContext, EventDetailsState) _onStateChangeListener() {
    return (context, state) {
      if (state is ErrorState) {
        showMessageDialog(
          context: context,
          title: context.l10N.common_error_title,
          content: context.l10N.common_error_message,
          onOkPressed: () {
            context.router.popForced();
          },
        );
      }
    };
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    EventDetailsState state,
  ) {
    if (state is LoadingState) {
      return Scaffold(
        body: LoadingWidget(),
      );
    }

    if (state is IdleState) {
      return Scaffold(
        appBar: DSAppBarV2(
          title: "Details",
        ),
        body: EventDetailsWidget(event: state.event),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
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
