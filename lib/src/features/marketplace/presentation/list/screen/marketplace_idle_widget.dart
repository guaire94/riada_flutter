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
import 'package:riada/src/features/marketplace/presentation/carousel/screen/marketplace_carousel_widget.dart';
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
  final List<MarketplaceCarouselType> contentSections = [
    MarketplaceCarouselType.calendar,
    MarketplaceCarouselType.upcoming,
    MarketplaceCarouselType.soccer,
  ];

  // MARK: - Properties
  final ScrollController _scrollController = ScrollController();

  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColorV2.neutral10,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action to be performed when the button is pressed
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        color: DSColorV2.neutral10,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            height: DSImageTypeV2.xl.height + _heightContent(),
            child: Stack(
              children: [
                _cityBackground(),
                _citySelector(),
                _mainContent(),
              ],
            ),
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
      top: DSImageTypeV2.xl.height,
      right: 0.0,
      left: 0.0,
      height: DSSpacingV2.m + _heightContent(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: DSSpacingV2.m),
          ...contentSections.map((s) => _sectionContent(type: s))
        ],
      ),
    );
  }

  Widget _sectionContent({required MarketplaceCarouselType type}) {
    return BlocProvider(
      create: (context) => getIt<Carousel.MarketplaceCarouselBloc>(),
      child: MarketplaceCarouselWidget(type: type),
    );
  }

  double _heightContent() {
    return contentSections.map((s) => s.height).reduce((a, b) => a + b);
  }
}
