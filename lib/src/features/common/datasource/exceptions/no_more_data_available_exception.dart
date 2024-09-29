import 'package:riada/src/utils/exceptions.dart';

class NoMoreDataAvailableException implements KlozyException {
  @override
  String get message => 'No more data available';
}
