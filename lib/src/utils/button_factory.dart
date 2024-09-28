import 'package:flutter/widgets.dart';

abstract class ButtonFactory {
  Widget createButton({
    required BuildContext context,
    required String total,
    required Function onPay,
  });
}
