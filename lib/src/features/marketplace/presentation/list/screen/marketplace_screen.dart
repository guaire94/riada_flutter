import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/base/base_state.dart';
import 'package:riada/src/features/marketplace/presentation/list/bloc/marketplace_bloc.dart';
import 'package:riada/src/features/marketplace/presentation/list/screen/marketplace_idle_widget.dart';

@RoutePage()
class MarketplaceScreen extends StatefulWidget implements AutoRouteWrapper {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<MarketplaceBloc>(),
      child: this,
    );
  }
}

class _MarketplaceScreenState
    extends BaseState<MarketplaceScreen, MarketplaceBloc> {
  // MARK: - Life cycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketplaceBloc, MarketplaceState>(
      buildWhen: _buildWhen,
      builder: _onStateChangeBuilder,
    );
  }

  bool _buildWhen(MarketplaceState previous, MarketplaceState current) {
    return current is LoadingState || current is IdleState;
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    MarketplaceState state,
  ) {
    if (state is IdleState) {
      return MarketplaceIdleWidget(
        state: state,
        onCityChange: (city) {
          bloc.add(ChangeCityEvent(city));
        },
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
