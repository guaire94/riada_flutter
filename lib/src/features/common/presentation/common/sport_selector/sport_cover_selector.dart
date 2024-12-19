import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_type_v2.dart';
import 'package:riada/src/design_system/v2/component/image/ds_image_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/features/event/entity/sport.dart';

class SportCoverSelector {
  // MARK: - Constant
  static final _coverImageType = DSImageTypeV2.m;
  static final double _contentHeight =
      _coverImageType.height + DSSpacingV2.m + DSSpacingV2.m;

  // MARK: - Public
  static void showSportCoverSelectionBottomSheet({
    required BuildContext context,
    required Sport selectedSport,
    required void Function(String) onCoverChange,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              height: _contentHeight,
              padding: EdgeInsets.only(
                bottom: DSSpacingV2.m,
                top: DSSpacingV2.m,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: selectedSport.covers
                    .map(
                      (cover) => _buildSportListTile(
                        context: context,
                        cover: cover,
                        onCoverChange: onCoverChange,
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildSportListTile({
    required BuildContext context,
    required String cover,
    required void Function(String) onCoverChange,
  }) {
    return GestureDetector(
      onTap: () {
        onCoverChange(cover);
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: DSSpacingV2.xxs),
        alignment: Alignment.center,
        child: DSImageV2(
          type: DSImageTypeV2.m,
          url: cover,
        ),
      ),
    );
  }
}
