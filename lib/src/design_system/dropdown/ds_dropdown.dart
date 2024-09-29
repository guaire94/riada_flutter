import 'package:riada/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_spacing_v2.dart';
import 'package:riada/src/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

enum DSDropdownType { form, small }

abstract class DSDropdownItem {
  String dropDownMenuItemName(BuildContext context);
}

class DSDropdownController extends ChangeNotifier {
  List<DSDropdownItem> _items = [];
  DSDropdownItem? _selectedItem;
  bool _withValidator = true;

  DSDropdownController({
    List<DSDropdownItem> items = const [],
    bool withValidator = true,
    DSDropdownItem? selectedItem = null,
  })  : _items = items,
        _withValidator = withValidator,
        _selectedItem = selectedItem;

  List<DSDropdownItem> get items => _items;

  set items(List<DSDropdownItem> value) {
    _items = value;
  }

  bool get withValidator => _withValidator;

  DSDropdownItem? get selectedItem => _selectedItem;

  set selectedItem(DSDropdownItem? value) {
    _selectedItem = value;
    notifyListeners();
  }
}

class DSDropdown<DSDropdownItem> extends StatefulWidget {
  final String _label;
  final DSDropdownController _controller;
  final bool _isEnabled;

  DSDropdown({
    Key? key,
    required DSDropdownController controller,
    bool isEnabled = true,
    required String label,
  })  : _controller = controller,
        _isEnabled = isEnabled,
        _label = label,
        super(key: key);

  @override
  State<DSDropdown> createState() => _DSDropdownState<DSDropdownItem>();
}

class _DSDropdownState<T> extends State<DSDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<T>(
          hint: Text(widget._label),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (_) {
            if (widget._controller._withValidator &&
                widget._controller.selectedItem == null) {
              return context.l10N.field_required_error_message;
            }
            return null;
          },
          style: context.textTheme.bodyLarge?.copyWith(
            color: DSColorV2.secondary,
          ),
          value: widget._controller._selectedItem as T,
          decoration: InputDecoration(
            labelStyle: context.textTheme.bodyLarge?.copyWith(
              color: DSColorV2.secondary,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
              borderSide: const BorderSide(color: DSColorV2.neutral70),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
              borderSide: const BorderSide(color: DSColorV2.secondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DSBorderRadiusV2.input),
              borderSide: const BorderSide(color: DSColorV2.secondary),
            ),
            labelText: widget._label,
            contentPadding: EdgeInsets.symmetric(
              horizontal: DSSpacingV2.l,
              vertical: DSSpacingV2.xs,
            ),
          ),
          onChanged: widget._isEnabled
              ? (T? newValue) {
                  setState(() {
                    widget._controller.selectedItem =
                        newValue as DSDropdownItem?;
                  });
                }
              : null,
          items: widget._controller.items.map((e) {
            return DropdownMenuItem<T>(
              child: Text(
                e.dropDownMenuItemName(context),
              ),
              value: e as T,
            );
          }).toList(),
        ),
      ],
    );
  }
}
