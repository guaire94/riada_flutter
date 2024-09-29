import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riada/src/features/common/entity/advertising/advertising_content_type.dart';
import 'package:riada/src/features/common/entity/advertising/advertising_source_tab.dart';
import 'package:riada/src/features/common/entity/advertising/advertising_type.dart';
import 'package:riada/src/features/common/entity/json_converter/advertising/advertising_content_type_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/advertising/advertising_source_tab_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/advertising/advertising_type_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_document_reference_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advertising.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@AdvertisingTypeJsonConverter()
@AdvertisingContentTypeJsonConverter()
@AdvertisingSourceTabJsonConverter()
@FirestoreDocumentReferenceJsonConverter()
class Advertising {
  final String id;
  final Timestamp createdDate;
  final Timestamp startDate;
  final Timestamp endDate;
  final AdvertisingSourceTab sourceTab;
  final AdvertisingType type;
  final AdvertisingContentType contentType;
  final DocumentReference content;

  const Advertising({
    required this.id,
    required this.createdDate,
    required this.startDate,
    required this.endDate,
    required this.sourceTab,
    required this.type,
    required this.contentType,
    required this.content,
  });

  factory Advertising.fromJson(Map<String, dynamic> json) =>
      _$AdvertisingFromJson(json);
}
