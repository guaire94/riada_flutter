import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riada/gen/assets.gen.dart';
import 'package:riada/src/design_system/ds_home_app_bar.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/drawer/presentation/bloc/drawer_bloc.dart'
    as DrawerBloc;
import 'package:riada/src/features/drawer/presentation/screen/drawer_screen.dart';
import 'package:riada/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:riada/src/router/routes.gr.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:riada/src/utils/constants.dart';
import 'package:riada/src/utils/deeplink_helper.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  // MARK: - Properties
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // MARK: - Life cycle
  @override
  _HomeScreenState createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: this,
    );
  }
}

class _HomeScreenState extends BaseState<HomeScreen, HomeBloc> {
  // MARK: - Constants
  static const double _logoSize = 100;

  // MARK: - LifeCycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(HomeState previous, HomeState current) {
    return current is LaunchState || current is IdleState;
  }

  bool _listenWhen(HomeState previous, HomeState current) {
    return current is RedirectState ||
        current is ErrorState ||
        current is FinaliseSignUpState;
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    HomeState state,
  ) {
    if (state is LaunchState) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: _logoSize,
                height: _logoSize,
                child: Assets.images.logo.circle.image(),
              ),
              SizedBox(height: DSSpacingV2.s),
              Text(
                Constants.appName,
                style: context.textTheme.displayLarge?.copyWith(
                  color: DSColorV2.secondary,
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (state is IdleState) {
      return AutoTabsScaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBarBuilder: (context, tabsRouter) {
          return DSHomeAppBar(
            onDrawerTapped: () {
              widget._scaffoldKey.currentState?.openEndDrawer();
            },
          );
        },
        scaffoldKey: widget._scaffoldKey,
        endDrawer: Drawer(
          child: BlocProvider(
            create: (context) => getIt<DrawerBloc.DrawerBloc>(),
            child: DrawerScreen(),
          ),
        ),
        endDrawerEnableOpenDragGesture: true,
      );
    }

    return Container();
  }

  Function(BuildContext, HomeState) _onStateChangeListener() {
    return (context, state) {
      if (state is RedirectState) {
        final route = DeeplinkHelper.getRouteFrom(state.deeplink);

        if (route != null) {
          context.router.popUntilRoot();
          context.router.pushAll(route);
        }
      } else if (state is FinaliseSignUpState) {
        context.pushRoute(AdditionalProfileInformationRoute());
      }
    };
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
