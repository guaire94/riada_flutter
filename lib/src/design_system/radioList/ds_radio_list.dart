import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

abstract class DSRadioListItem {
  String radioItemLeadingText(BuildContext context);
  String radioItemTrailingText(BuildContext context);
}

class DSRadioListController extends ChangeNotifier {
  List<DSRadioListItem> _items = [];
  DSRadioListItem _selectedItem;
  String _title;

  DSRadioListController({
    required List<DSRadioListItem> items,
    required int selectedIndex,
    String title = "",
  })  : _items = items,
        _selectedItem = items[selectedIndex],
        _title = title;

  List<DSRadioListItem> get items => _items;

  set title(String value) {
    _title = value;
  }

  set items(List<DSRadioListItem> value) {
    _items = value;
  }

  DSRadioListItem get selectedItem => _selectedItem;

  set selectedItem(DSRadioListItem value) {
    _selectedItem = value;
    notifyListeners();
  }
}

class DSRadioList extends StatefulWidget {
  final DSRadioListController _controller;
  DSRadioList({
    Key? key,
    required DSRadioListController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  State<DSRadioList> createState() => _DSRadioListState();
}

class _DSRadioListState extends State<DSRadioList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget._controller._title,
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(height: DSSpacingV2.xxs),
        for (var element in widget._controller.items) _item(element)
      ],
    );
  }

  // MARK: - Private
  Widget _item(DSRadioListItem element) {
    return Container(
      margin: EdgeInsets.only(bottom: DSSpacingV2.xxs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DSSpacingV2.xl),
        border: Border.all(color: DSColorV2.neutral70),
      ),
      child: RadioListTile<DSRadioListItem>(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              element.radioItemLeadingText(context),
              style: context.textTheme.titleLarge,
            ),
            Text(
              element.radioItemTrailingText(context),
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
        ),
        activeColor: DSColorV2.primary,
        value: element,
        groupValue: widget._controller._selectedItem,
        onChanged: (DSRadioListItem? value) {
          setState(() {
            if (value != null) {
              widget._controller.selectedItem = value;
            }
          });
        },
      ),
    );
  }
}
