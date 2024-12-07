import 'package:flutter/material.dart';
import 'package:riada/src/design_system/v2/component/buttons/ds_button_text_v2.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_item.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_item.dart';
import 'package:riada/src/design_system/v2/component/dsList/ds_list_view_type.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';

class DSListView extends StatelessWidget {
  // MARK: - Properties
  final DSListViewType _type;
  final String? _title;
  final List<DSListItem> _items;
  final void Function(DSListItem) _onTap;
  final void Function(DSListItem)? _onDoubleTap;
  final Future<void> Function()? _onRefresh;
  final void Function()? _onSeeAllPressed;

  // MARK: - LifeCycle
  const DSListView({
    Key? key,
    required DSListViewType type,
    String? title = null,
    required List<DSListItem> items,
    required void Function(DSListItem) onTap,
    void Function(DSListItem)? onDoubleTap,
    Future<void> Function()? onRefresh,
    void Function()? onSeeAllPressed,
  })  : _type = type,
        _title = title,
        _items = items,
        _onTap = onTap,
        _onDoubleTap = onDoubleTap,
        _onRefresh = onRefresh,
        _onSeeAllPressed = onSeeAllPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget content;
    if (_onRefresh != null) {
      content = RefreshIndicator(
        onRefresh: _onRefresh,
        child: _content(),
      );
    } else {
      content = _content();
    }

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
                  onPressed: _onSeeAllPressed,
                  text: context.l10N.see_all,
                ),
            ],
          ),
        ),
        SizedBox(height: DSSpacingV2.xxs),
        Expanded(
          child: content,
        )
      ],
    );
  }

  // MARK: Private
  List<Widget> _viewItems() {
    if (_type == DSListViewType.smallGrid) {
      return List.generate(_items.length, (index) {
        return DSListViewItem(
          listType: _type,
          item: _items[index],
          onTap: _onTap,
          onDoubleTap: _onDoubleTap,
        );
      });
    } else if (_type == DSListViewType.longGrid) {
      return List.generate(_items.length, (index) {
        return Container(
          padding: EdgeInsets.only(
            bottom: DSSpacingV2.s,
            left: DSSpacingV2.s,
            right: DSSpacingV2.s,
          ),
          child: DSListViewItem(
            listType: _type,
            item: _items[index],
            onTap: _onTap,
            onDoubleTap: _onDoubleTap,
          ),
        );
      });
    } else {
      return List.generate(_items.length, (index) {
        if (index == 0) {
          return Container(
            padding: EdgeInsets.only(left: DSSpacingV2.m, right: DSSpacingV2.s),
            child: DSListViewItem(
              listType: _type,
              item: _items[index],
              onTap: _onTap,
              onDoubleTap: _onDoubleTap,
            ),
          );
        } else if (index == _items.length) {
          return Container(
            padding: EdgeInsets.only(right: DSSpacingV2.m),
            child: DSListViewItem(
              listType: _type,
              item: _items[index],
              onTap: _onTap,
              onDoubleTap: _onDoubleTap,
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.only(right: DSSpacingV2.s),
            child: DSListViewItem(
              listType: _type,
              item: _items[index],
              onTap: _onTap,
              onDoubleTap: _onDoubleTap,
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
