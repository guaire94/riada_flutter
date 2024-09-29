import 'package:riada/src/features/common/entity/advertising/advertising_content_type.dart';
import 'package:json_annotation/json_annotation.dart';

class AdvertisingContentTypeJsonConverter
    extends JsonConverter<AdvertisingContentType, String> {
  const AdvertisingContentTypeJsonConverter();

  @override
  AdvertisingContentType fromJson(String advertisingContentType) {
    return AdvertisingContentType.values
        .firstWhere((element) => element.name == advertisingContentType);
  }

  @override
  String toJson(AdvertisingContentType advertisingContentType) {
    return advertisingContentType.name;
  }
}
