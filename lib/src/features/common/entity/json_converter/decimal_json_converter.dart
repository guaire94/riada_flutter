import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

class DecimalJsonConverter extends JsonConverter<Decimal, String> {
  const DecimalJsonConverter();

  @override
  Decimal fromJson(String decimal) {
    return Decimal.parse(decimal);
  }

  @override
  String toJson(Decimal decimal) {
    return decimal.toString();
  }
}
