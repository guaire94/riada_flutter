import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riada/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/common/presentation/common/loading_widget.dart';
import 'package:riada/src/features/user/presentation/my_profile/bloc/my_profile_bloc.dart';
import 'package:riada/src/features/user/presentation/my_profile/screen/my_informations_widget.dart';
import 'package:riada/src/features/user/presentation/my_profile/screen/my_profile_list_view_item.dart';
import 'package:riada/src/utils/build_context_extension.dart';

@RoutePage()
class MyProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<MyProfileBloc>(),
      child: this,
    );
  }
}

class _MyProfileScreenState extends BaseState<MyProfileScreen, MyProfileBloc>
    with TickerProviderStateMixin {
  // MARK: - Properties
  late TabController tabController;

  // MARK: - LifeCycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProfileBloc, MyProfileState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(MyProfileState previous, MyProfileState current) {
    return current is LoadingState || current is IdleState;
  }

  bool _listenWhen(MyProfileState previous, MyProfileState current) {
    return current is ErrorState || current is LogoutState;
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    MyProfileState state,
  ) {
    switch (state.runtimeType) {
      case IdleState:
        return _idleState(state: state as IdleState);
      case LoadingState:
        return Scaffold(
          body: LoadingWidget(),
        );
    }
    return Container();
  }

  Function(BuildContext, MyProfileState) _onStateChangeListener() {
    return (context, state) {
      if (state is LogoutState) {
        context.router.popForced();
      } else if (state is ErrorState) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(context.l10N.common_error_title),
              content: Text(context.l10N.common_error_message),
              actions: <Widget>[
                TextButton(
                  child: Text(context.l10N.ok),
                  onPressed: () => context.router.popForced(),
                ),
              ],
            );
          },
        );
      }
    };
  }

  Widget _idleState({required IdleState state}) {
    return Scaffold(
      appBar: DSAppBarV2(
        title: context.l10N.my_profile_title,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: DSSpacingV2.xl),
            MyInformationsWidget(user: state.user),
            SizedBox(height: DSSpacingV2.xl),
            Expanded(
              child: ListView(
                children: [
                  MyProfileListView(MyProfileListItem.information),
                  MyProfileListView(MyProfileListItem.privacyPolicy),
                  MyProfileListView(MyProfileListItem.cgv),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          bloc.add(LogoutEvent());
        },
        child: Text(
          context.l10N.logout,
          style: context.textTheme.bodyLarge?.copyWith(
            color: DSColorV2.danger,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
