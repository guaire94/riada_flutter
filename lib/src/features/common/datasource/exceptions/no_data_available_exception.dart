import 'package:template_flutter_app/src/utils/exceptions.dart';

class NoDataAvailableException implements KlozyException {
  @override
  String get message => 'No data Available';
}
