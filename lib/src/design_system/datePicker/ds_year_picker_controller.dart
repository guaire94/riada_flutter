class DSYearPickerController {
  DateTime? _date;

  DateTime? get date => _date;

  String get content {
    if (_date != null) {
      return _date!.year.toString();
    }

    return "";
  }

  set date(DateTime? value) {
    _date = value;
  }
}
