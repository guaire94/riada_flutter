import 'package:auto_route/auto_route.dart';
import 'package:template_flutter_app/src/design_system/v2/component/appBar/ds_app_bar_v2.dart';
import 'package:template_flutter_app/src/factory/di.dart';
import 'package:template_flutter_app/src/features/common/presentation/base/base_state.dart';
import 'package:template_flutter_app/src/features/common/presentation/common/loading_widget.dart';
import 'package:template_flutter_app/src/features/list/presentation/details/bloc/details_bloc.dart';
import 'package:template_flutter_app/src/features/list/presentation/details/screen/details_widget.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:template_flutter_app/src/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  // MARK: - Dependencies
  final String _productId;

  // MARK: - LifeCycle
  const DetailsScreen({
    Key? key,
    required String productId,
  })  : _productId = productId,
        super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();

  @override
  Widget wrappedRoute(context) {
    return BlocProvider(
      create: (context) => getIt<DetailsBloc>(),
      child: this,
    );
  }
}

class _DetailsScreenState extends BaseState<DetailsScreen, DetailsBloc> {
  // MARK: - Life cycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent(productId: widget._productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
      builder: _onStateChangeBuilder,
      listener: _onStateChangeListener(),
    );
  }

  bool _buildWhen(DetailsState previous, DetailsState current) {
    return current is LoadingState ||
        current is IdleState ||
        current is ErrorState;
  }

  bool _listenWhen(DetailsState previous, DetailsState current) {
    return current is ErrorState;
  }

  Function(BuildContext, DetailsState) _onStateChangeListener() {
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
    DetailsState state,
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
        body: DetailsWidget(product: state.product),
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
