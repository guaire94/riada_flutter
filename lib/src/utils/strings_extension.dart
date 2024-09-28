extension StringExtension on String {
  String trimAndCapitalize() {
    String trimmedString = this.trimLeft();
    if (trimmedString.isEmpty) {
      return trimmedString;
    }
    return "${trimmedString[0].toUpperCase()}${trimmedString.substring(1).toLowerCase()}";
  }
}
