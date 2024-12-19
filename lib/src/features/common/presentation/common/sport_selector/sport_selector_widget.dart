import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/features/event/entity/sport.dart';

class SportSelectorWidget extends StatefulWidget {
  // MARK: - Properties
  final Sport selectedSport;
  final List<Sport> sports;
  final void Function(Sport) onSportChange;

  // MARK: - Life cycle
  const SportSelectorWidget({
    Key? key,
    required this.selectedSport,
    required this.sports,
    required this.onSportChange,
  }) : super(key: key);

  @override
  State<SportSelectorWidget> createState() => _SportSelectorWidgetState();
}

class _SportSelectorWidgetState extends State<SportSelectorWidget> {
  // MARK: - Constants
  static final double _sportSelectorHeight = 40;
  static final double _tileHeight = 72;

  // MARK: - Life cycle
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showSportSelectionBottomSheet,
      child: _sportSelectorButton(),
    );
  }

  // MARK: - Private
  void _showSportSelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              height: widget.sports.length * _tileHeight,
              child: ListView(
                children: widget.sports.map(_buildSportListTile).toList(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSportListTile(Sport sport) {
    return Container(
      height: _tileHeight,
      padding: EdgeInsets.only(bottom: DSSpacingV2.l),
      alignment: Alignment.center,
      child: ListTile(
        title: Text(
          sport.localizedName(context),
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        onTap: () {
          widget.onSportChange(sport);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _sportSelectorButton() {
    return Container(
      padding: EdgeInsets.all(DSSpacingV2.xxs),
      color: Colors.white24,
      height: _sportSelectorHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.selectedSport.localizedName(context),
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
