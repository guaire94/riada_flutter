import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:template_flutter_app/src/factory/di.dart';
import 'package:template_flutter_app/src/features/marketplace/event_bus/marketplace_scrolled_event.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/bloc/marketplace_carousel_bloc.dart'
    as Carousel;
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/carousel/screen/marketplace_carousel_screen.dart';
import 'package:template_flutter_app/src/features/marketplace/presentation/list/bloc/marketplace_bloc.dart';
import 'package:template_flutter_app/src/utils/app_event_bus.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketplaceIdleWidget extends StatefulWidget {
  // MARK: - Properties
  final IdleState _state;

  // MARK: - Life cycle
  const MarketplaceIdleWidget({
    Key? key,
    required IdleState state,
  })  : _state = state,
        super(key: key);

  @override
  State<MarketplaceIdleWidget> createState() => _MarketplaceIdleWidgetState();
}

class _MarketplaceIdleWidgetState extends State<MarketplaceIdleWidget> {
  // MARK: - Constants
  static final double _offset = 72;
  static final double _contentHeight = 1150;
  double _mainRadius = 20;
  bool _inContainer = false;

  // MARK: - Properties
  final ScrollController _scrollController = ScrollController();

  // MARK: - Life cycle
  @override
  void initState() {
    _scrollController.addListener(_handleControllerNotification);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DSColorV2.neutral10,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: _contentHeight + _offset,
          child: Stack(
            children: [
              _userGreetings(),
              _mainContent(),
            ],
          ),
        ),
      ),
    );
  }

  // MARK: - Private
  Widget _mainContent() {
    return Positioned(
      top: _offset,
      right: 0.0,
      left: 0.0,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_mainRadius),
            topRight: Radius.circular(_mainRadius),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _content(type: MarketplaceCarouselType.list),
            SizedBox(height: DSSpacingV2.m),
          ],
        ),
      ),
    );
  }

  Widget _userGreetings() {
    final String text;
    if (widget._state.currentUser == null) {
      text = context.l10N.marketplace_title_with_no_user;
    } else {
      text = context.l10N
          .marketplace_title_with_user(widget._state.currentUser!.name);
    }
    return Positioned(
      top: DSSpacingV2.l,
      left: DSSpacingV2.s,
      right: 0,
      height: _offset,
      child: Text(
        text,
        style: context.textTheme.headlineLarge,
      ),
    );
  }

  Widget _content({required MarketplaceCarouselType type}) {
    return BlocProvider(
      create: (context) => getIt<Carousel.MarketplaceCarouselBloc>(),
      child: MarketplaceCarouselWidget(type: type),
    );
  }

  void _handleControllerNotification() {
    if (_scrollController.position.pixels < _offset) {
      if (!_inContainer) {
        _inContainer = true;
        AppEventBus.instance.fire(MarketplaceScrollerEvent(_inContainer));
        setState(() {
          _mainRadius = 20;
        });
      }
    } else if (_inContainer) {
      _inContainer = false;
      AppEventBus.instance.fire(MarketplaceScrollerEvent(_inContainer));
      setState(() {
        _mainRadius = 0;
      });
    }
  }
}
