import 'package:template_flutter_app/src/design_system/segment/ds_segment_item.dart';

class DSSegmentController {
  // MARK: - Properties
  List<DSSegmentContent> _items;
  DSSegmentContent _selectItem;

  // MARK: - Life cycle
  DSSegmentController({
    required List<DSSegmentContent> items,
    required DSSegmentContent selectItem,
  })  : _items = items,
        _selectItem = selectItem;

  // MARK: - Getters
  DSSegmentContent get selectItem => _selectItem;
  List<DSSegmentContent> get items => _items;

  // MARK: - Setters
  set selectItem(DSSegmentContent item) {
    _selectItem = item;
  }
}
