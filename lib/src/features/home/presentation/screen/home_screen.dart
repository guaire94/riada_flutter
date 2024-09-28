import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/gen/assets.gen.dart';
import 'package:template_flutter_app/src/design_system/ds_home_app_bar.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/factory/di.dart';
import 'package:template_flutter_app/src/features/common/presentation/base/base_state.dart';
import 'package:template_flutter_app/src/features/drawer/presentation/bloc/drawer_bloc.dart'
    as DrawerBloc;
import 'package:template_flutter_app/src/features/drawer/presentation/screen/drawer_screen.dart';
import 'package:template_flutter_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:template_flutter_app/src/features/marketplace/event_bus/marketplace_scrolled_event.dart';
import 'package:template_flutter_app/src/router/routes.gr.dart';
import 'package:template_flutter_app/src/utils/app_event_bus.dart';
import 'package:template_flutter_app/src/utils/constants.dart';
import 'package:template_flutter_app/src/utils/deeplink_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  // MARK: - Properties
  Color _marketplaceAppBarColor = DSColorV2.neutral10;
  static const _logoWidth = 200.0;

  // MARK: - LifeCycle
  @override
  void initState() {
    super.initState();
    _registerMarketPlaceScrollListener();
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
        backgroundColor: DSColorV2.secondary,
        body: Center(
          child: Text(
            "Template Logo",
          ),
        ),
      );
    }
    if (state is IdleState) {
      return AutoTabsScaffold(
        scaffoldKey: widget._scaffoldKey,
        appBarBuilder: (context, tabsRouter) {
          Color color;
          switch (tabsRouter.activeIndex) {
            case 0:
              color = _marketplaceAppBarColor;
              break;

            default:
              color = Colors.white;
              break;
          }
          return DSHomeAppBar(
            activeIndex: tabsRouter.activeIndex,
            title: TemplateConstants.appName,
            color: color,
            onDrawerTapped: () {
              widget._scaffoldKey.currentState?.openEndDrawer();
            },
          );
        },
        routes: [
          MarketplaceRoute(),
          ListRoute(),
        ],
        endDrawer: Drawer(
          child: BlocProvider(
            create: (context) => getIt<DrawerBloc.DrawerBloc>(),
            child: DrawerScreen(),
          ),
        ),
        endDrawerEnableOpenDragGesture: false,
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

  // MARK: - Private
  _registerMarketPlaceScrollListener() {
    AppEventBus.instance.on<MarketplaceScrollerEvent>().listen((event) async {
      setState(() {
        if (event.inContainer) {
          _marketplaceAppBarColor = DSColorV2.neutral10;
        } else {
          _marketplaceAppBarColor = Colors.white;
        }
      });
    });
  }
}
