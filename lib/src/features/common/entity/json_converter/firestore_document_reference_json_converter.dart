import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class FirestoreDocumentReferenceJsonConverter
    extends JsonConverter<DocumentReference, DocumentReference> {
  const FirestoreDocumentReferenceJsonConverter();

  @override
  DocumentReference<Object?> fromJson(DocumentReference<Object?> json) {
    return json;
  }

  @override
  DocumentReference<Object?> toJson(DocumentReference<Object?> object) {
    return object;
  }
}
