import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/src/factory/di.dart';
import 'package:template_flutter_app/src/features/common/presentation/base/base_state.dart';
import 'package:template_flutter_app/src/features/user/presentation/additional_profile_information/bloc/additional_profile_information_bloc.dart';
import 'package:template_flutter_app/src/features/user/presentation/additional_profile_information/screen/additional_profile_information_idle_widget.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AdditionalProfileInformationScreen extends StatefulWidget
    implements AutoRouteWrapper {
  @override
  State<AdditionalProfileInformationScreen> createState() =>
      _AdditionalProfileInformationScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<AdditionalProfileInformationBloc>(),
      child: this,
    );
  }
}

class _AdditionalProfileInformationScreenState extends BaseState<
    AdditionalProfileInformationScreen, AdditionalProfileInformationBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdditionalProfileInformationBloc,
        AdditionalProfileInformationState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(AdditionalProfileInformationState previous,
      AdditionalProfileInformationState current) {
    return current is LoadingState || current is IdleState;
  }

  bool _listenWhen(AdditionalProfileInformationState previous,
      AdditionalProfileInformationState current) {
    return current is SuccessState || current is ErrorState;
  }

  Function(BuildContext, AdditionalProfileInformationState)
      _onStateChangeListener() {
    return (context, state) async {
      if (state is SuccessState) {
        context.router.popForced();
      }
      if (state is ErrorState) {
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

  Widget _onStateChangeBuilder(
    BuildContext context,
    AdditionalProfileInformationState state,
  ) {
    switch (state.runtimeType) {
      case IdleState:
        return AdditionalProfileInformationIdleWidget(
          state: state as IdleState,
          bloc: bloc,
        );
      case LoadingState:
        return _loadingWidget();
    }
    return Container();
  }

  Widget _loadingWidget() {
    return Container();
  }
}
