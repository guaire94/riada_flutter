import 'package:template_flutter_app/src/features/common/entity/advertising/advertising_type.dart';
import 'package:json_annotation/json_annotation.dart';

class AdvertisingTypeJsonConverter
    extends JsonConverter<AdvertisingType, String> {
  const AdvertisingTypeJsonConverter();

  @override
  AdvertisingType fromJson(String advertisingType) {
    return AdvertisingType.values
        .firstWhere((element) => element.name == advertisingType);
  }

  @override
  String toJson(AdvertisingType advertisingType) {
    return advertisingType.name;
  }
}
