import 'package:riada/src/design_system/v2/component/buttons/ds_button_text_v2.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/component/dsList/shimmer/ds_list_view_shimmer_item.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DSListViewShimmer extends StatelessWidget {
  // MARK: - Dependencies
  final DSListViewType _type;
  final String? _title;

  // MARK: - LifeCycle
  const DSListViewShimmer({
    Key? key,
    required DSListViewType type,
    String? title = null,
  })  : _type = type,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = _content();

    if (_title == null) {
      return content;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: DSSpacingV2.m),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _title,
                style: context.textTheme.headlineLarge,
              ),
              if (_type.seeAllButton)
                DSButtonTextV2(
                  onPressed: () {},
                  text: context.l10N.see_all,
                ),
            ],
          ),
        ),
        SizedBox(height: DSSpacingV2.s),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: content,
          ),
        )
      ],
    );
  }

  // MARK: Private
  List<Widget> _viewItems() {
    if (_type == DSListViewType.smallGrid) {
      return List.generate(_type.nbShimmerItems, (index) {
        return DSListViewShimmerItem(
          listType: _type,
        );
      });
    } else if (_type == DSListViewType.longGrid) {
      return List.generate(_type.nbShimmerItems, (index) {
        return Container(
          padding: EdgeInsets.only(
            bottom: DSSpacingV2.s,
            left: DSSpacingV2.s,
            right: DSSpacingV2.s,
          ),
          child: DSListViewShimmerItem(
            listType: _type,
          ),
        );
      });
    } else {
      return List.generate(_type.nbShimmerItems, (index) {
        if (index == 0) {
          return Container(
            padding: EdgeInsets.only(left: DSSpacingV2.m, right: DSSpacingV2.s),
            child: DSListViewShimmerItem(
              listType: _type,
            ),
          );
        } else if (index == _type.nbShimmerItems) {
          return Container(
            padding: EdgeInsets.only(right: DSSpacingV2.m),
            child: DSListViewShimmerItem(
              listType: _type,
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.only(right: DSSpacingV2.s),
            child: DSListViewShimmerItem(
              listType: _type,
            ),
          );
        }
      });
    }
  }

  Widget _content() {
    switch (_type) {
      case DSListViewType.smallGrid:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: DSSpacingV2.m),
          child: GridView.count(
            scrollDirection: _type.scrollDirection,
            mainAxisSpacing: DSSpacingV2.s,
            crossAxisSpacing: DSSpacingV2.s,
            crossAxisCount: 2,
            children: _viewItems(),
          ),
        );
      case DSListViewType.longGrid:
        return SingleChildScrollView(
          scrollDirection: _type.scrollDirection,
          child: Container(
            child: Column(
              children: _viewItems(),
            ),
          ),
        );
      case DSListViewType.largeCarousel:
      case DSListViewType.longCarousel:
      case DSListViewType.smallCarousel:
        return SingleChildScrollView(
          scrollDirection: _type.scrollDirection,
          child: Container(
            child: Row(
              children: _viewItems(),
            ),
          ),
        );
    }
  }
}
