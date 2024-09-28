import 'package:template_flutter_app/src/utils/exceptions.dart';

class NoMoreDataAvailableException implements KlozyException {
  @override
  String get message => 'No more data available';
}
