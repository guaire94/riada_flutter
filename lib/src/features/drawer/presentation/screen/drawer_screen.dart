import 'package:auto_route/auto_route.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:riada/src/features/drawer/presentation/widget/drawer_idle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DrawerScreen extends StatefulWidget {
  // MARK: - Life cycle
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends BaseState<DrawerScreen, DrawerBloc> {
  // MARK: - LifeCycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerBloc, DrawerState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(DrawerState previous, DrawerState current) {
    return current is LoadingState || current is IdleState;
  }

  bool _listenWhen(DrawerState previous, DrawerState current) {
    return current is LoginSuccessState;
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    DrawerState state,
  ) {
    if (state is IdleState) {
      return DrawerIdleWidget(
        user: state.currentUser,
        onLogout: () {
          bloc.add(LogoutEvent());
        },
      );
    }

    return Container();
  }

  Function(BuildContext, DrawerState) _onStateChangeListener() {
    return (context, state) {
      if (state is LoginSuccessState) {
        _closeEndDrawer(context: context);
      }
    };
  }

  // MARK: - Private
  void _closeEndDrawer({
    required BuildContext context,
  }) {
    context.router.popForced();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
