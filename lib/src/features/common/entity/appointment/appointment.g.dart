// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as String,
      date: const FirestoreTimestampJsonConverter()
          .fromJson(json['date'] as Timestamp),
      status: const AppointmentStatusJsonConverter()
          .fromJson(json['status'] as String),
      createdDate: const FirestoreTimestampJsonConverter()
          .fromJson(json['createdDate'] as Timestamp),
      service: const FirestoreDocumentReferenceJsonConverter()
          .fromJson(json['service'] as DocumentReference<Object?>),
      company: const FirestoreDocumentReferenceJsonConverter()
          .fromJson(json['company'] as DocumentReference<Object?>),
      customer: const FirestoreDocumentReferenceJsonConverter()
          .fromJson(json['customer'] as DocumentReference<Object?>),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const FirestoreTimestampJsonConverter().toJson(instance.date),
      'status': const AppointmentStatusJsonConverter().toJson(instance.status),
      'createdDate':
          const FirestoreTimestampJsonConverter().toJson(instance.createdDate),
      'service': const FirestoreDocumentReferenceJsonConverter()
          .toJson(instance.service),
      'company': const FirestoreDocumentReferenceJsonConverter()
          .toJson(instance.company),
      'customer': const FirestoreDocumentReferenceJsonConverter()
          .toJson(instance.customer),
    };
