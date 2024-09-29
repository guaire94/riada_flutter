import 'package:riada/src/features/common/entity/advertising/advertising_source_tab.dart';
import 'package:json_annotation/json_annotation.dart';

class AdvertisingSourceTabJsonConverter
    extends JsonConverter<AdvertisingSourceTab, String> {
  const AdvertisingSourceTabJsonConverter();

  @override
  AdvertisingSourceTab fromJson(String advertisingSourceTab) {
    return AdvertisingSourceTab.values
        .firstWhere((element) => element.name == advertisingSourceTab);
  }

  @override
  String toJson(AdvertisingSourceTab advertisingSourceTab) {
    return advertisingSourceTab.name;
  }
}
