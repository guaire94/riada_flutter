import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/city.dart';

class CitySelectorWidget extends StatefulWidget {
  // MARK: - Properties
  final City selectedCity;
  final List<City> cities;
  final void Function(City?) onCityChange;

  // MARK: - Life cycle
  const CitySelectorWidget({
    Key? key,
    required this.selectedCity,
    required this.cities,
    required this.onCityChange,
  }) : super(key: key);

  @override
  State<CitySelectorWidget> createState() => _CitySelectorWidgetState();
}

class _CitySelectorWidgetState extends State<CitySelectorWidget> {
  // MARK: - Constants
  static final double _citySelectorHeight = 40;
  static final double _tileHeight = 72;

  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCitySelectionBottomSheet,
      child: _citySelectorButton(),
    );
  }

  // MARK: - Private
  void _showCitySelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              height: widget.cities.length * _tileHeight,
              child: ListView(
                children: widget.cities.map(_buildCityListTile).toList(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCityListTile(City city) {
    return Container(
      height: _tileHeight,
      padding: EdgeInsets.only(bottom: DSSpacingV2.l),
      alignment: Alignment.center,
      child: ListTile(
        title: Text(
          city.name(context),
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        onTap: () {
          widget.onCityChange(city);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _citySelectorButton() {
    return Container(
      padding: EdgeInsets.all(DSSpacingV2.xxs),
      color: Colors.white24,
      height: _citySelectorHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.selectedCity.name(context),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Icon(
            size: 30,
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
