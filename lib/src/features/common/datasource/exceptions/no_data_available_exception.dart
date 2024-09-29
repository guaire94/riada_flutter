import 'package:riada/src/utils/exceptions.dart';

class NoDataAvailableException implements KlozyException {
  @override
  String get message => 'No data Available';
}
