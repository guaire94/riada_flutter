import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/firestore_document_reference_json_converter.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@FirestoreDocumentReferenceJsonConverter()
class Notification {
  final String id;
  final String userId;
  final String? deeplink;
  final Timestamp createdDate;
  final bool isChat;

  Notification({
    this.id = "",
    required this.userId,
    this.deeplink,
    required this.createdDate,
    this.isChat = false,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  Notification copyWith({
    String? id,
    String? userId,
    String? deeplink,
    Timestamp? createdDate,
    bool? isChat,
    DocumentReference? user,
    DocumentReference? clothe,
  }) {
    return Notification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      deeplink: deeplink ?? this.deeplink,
      createdDate: createdDate ?? this.createdDate,
      isChat: isChat ?? this.isChat,
    );
  }
}
