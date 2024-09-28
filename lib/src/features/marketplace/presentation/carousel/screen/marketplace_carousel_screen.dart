import 'package:template_flutter_app/src/features/common/presentation/base/base_state.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/bloc/marketplace_carousel_bloc.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/screen/marketplace_carousel_idle_widget.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/screen/marketplace_carousel_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketplaceCarouselWidget extends StatefulWidget {
  final MarketplaceCarouselType _type;
  const MarketplaceCarouselWidget({
    Key? key,
    required MarketplaceCarouselType type,
  })  : _type = type,
        super(key: key);

  @override
  State<MarketplaceCarouselWidget> createState() =>
      _MarketplaceCarouselWidgetState();
}

class _MarketplaceCarouselWidgetState
    extends BaseState<MarketplaceCarouselWidget, MarketplaceCarouselBloc> {
  // MARK: - Life cycle
  @override
  void initState() {
    super.initState();
    bloc.add(LoadEvent(type: widget._type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketplaceCarouselBloc, MarketplaceCarouselState>(
      buildWhen: _buildWhen,
      builder: _onStateChangeBuilder,
    );
  }

  bool _buildWhen(
      MarketplaceCarouselState previous, MarketplaceCarouselState current) {
    return current is LoadingState ||
        current is IdleState ||
        current is EmptyState;
  }

  Widget _onStateChangeBuilder(
    BuildContext context,
    MarketplaceCarouselState state,
  ) {
    if (state is LoadingState) {
      return MarketplaceCarouselLoadingWidget(
        type: widget._type,
      );
    }

    if (state is EmptyState) {
      return SizedBox.shrink();
    }

    if (state is IdleState) {
      return MarketplaceCarouselIdleWidget(
        state: state,
        type: widget._type,
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
