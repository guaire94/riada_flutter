import 'package:decimal/decimal.dart';
import 'package:money_formatter/money_formatter.dart';

extension DecimalExtension on Decimal {
  String formatPrice() {
    MoneyFormatter fmf = MoneyFormatter(amount: this.toDouble());
    return fmf.output.compactNonSymbol;
  }
}
