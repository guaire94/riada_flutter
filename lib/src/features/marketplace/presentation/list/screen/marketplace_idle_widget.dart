import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/factory/di.dart';
import 'package:riada/src/features/common/presentation/common/city_selector/city_selector_widget.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/bloc/marketplace_carousel_bloc.dart'
    as Carousel;
import 'package:riada/src/features/marketplace/presentation/carousel/item/marketplace_carousel_type.dart';
import 'package:riada/src/features/marketplace/presentation/carousel/screen/marketplace_carousel_screen.dart';
import 'package:riada/src/features/marketplace/presentation/list/bloc/marketplace_bloc.dart';
import 'package:riada/src/utils/city.dart';

class MarketplaceIdleWidget extends StatefulWidget {
  // MARK: - Properties
  final IdleState _state;
  final void Function(City?) _onCityChange;

  // MARK: - Life cycle
  const MarketplaceIdleWidget({
    Key? key,
    required IdleState state,
    required void Function(City?) onCityChange,
  })  : _state = state,
        _onCityChange = onCityChange,
        super(key: key);

  @override
  State<MarketplaceIdleWidget> createState() => _MarketplaceIdleWidgetState();
}

class _MarketplaceIdleWidgetState extends State<MarketplaceIdleWidget> {
  // MARK: - Constants
  static final double _citySelectorHeight = 40;
  static final double _offset = 72;
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
          // height: _contentHeight + _offset,
          child: Stack(
            children: [
              _cityBackground(),
              _citySelector(),
            ],
          ),
        ),
      ),
    );
  }

  // MARK: - Private

  Widget _cityBackground() {
    return Positioned(
      child: Container(
        height: DSImageTypeV2.xl.height,
        width: DSImageTypeV2.xl.width,
        child: Column(
          children: [
            Container(
              width: DSImageTypeV2.xl.width,
              height: DSImageTypeV2.xl.height,
              child: widget._state.selectedCity.background,
            ),
          ],
        ),
      ),
    );
  }

  Widget _citySelector() {
    return Positioned(
      left: DSSpacingV2.s,
      top: DSImageTypeV2.xl.height - (_citySelectorHeight + DSSpacingV2.s),
      child: CitySelectorWidget(
        selectedCity: widget._state.selectedCity,
        cities: widget._state.cities,
        onCityChange: widget._onCityChange,
      ),
    );
  }

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
            _content(type: MarketplaceCarouselType.events),
            SizedBox(height: DSSpacingV2.m),
          ],
        ),
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
        setState(() {
          _mainRadius = 20;
        });
      }
    } else if (_inContainer) {
      _inContainer = false;
      setState(() {
        _mainRadius = 0;
      });
    }
  }
}
