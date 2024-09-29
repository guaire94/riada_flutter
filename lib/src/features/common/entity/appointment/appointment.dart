import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riada/src/features/common/entity/appointment/appointment_status.dart';
import 'package:riada/src/features/common/entity/json_converter/appointment/appointment_status_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_document_reference_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@FirestoreDocumentReferenceJsonConverter()
@AppointmentStatusJsonConverter()
class Appointment {
  final String id;
  final Timestamp date;
  final AppointmentStatus status;
  final Timestamp createdDate;
  final DocumentReference service;
  final DocumentReference company;
  final DocumentReference customer;

  Appointment({
    required this.id,
    required this.date,
    required this.status,
    required this.createdDate,
    required this.service,
    required this.company,
    required this.customer,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
