import 'package:template_flutter_app/src/features/list/entity/product_status.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductStatusJsonConverter extends JsonConverter<ProductStatus, String> {
  const ProductStatusJsonConverter();

  @override
  ProductStatus fromJson(String productStatus) {
    return ProductStatus.values
        .firstWhere((element) => element.name == productStatus);
  }

  @override
  String toJson(ProductStatus productStatus) {
    return productStatus.name;
  }
}
