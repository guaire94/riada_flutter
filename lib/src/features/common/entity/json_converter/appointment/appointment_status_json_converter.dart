import 'package:riada/src/features/common/entity/appointment/appointment_status.dart';
import 'package:json_annotation/json_annotation.dart';

class AppointmentStatusJsonConverter
    extends JsonConverter<AppointmentStatus, String> {
  const AppointmentStatusJsonConverter();

  @override
  AppointmentStatus fromJson(String appointmentStatus) {
    return AppointmentStatus.values
        .firstWhere((element) => element.name == appointmentStatus);
  }

  @override
  String toJson(AppointmentStatus appointmentStatus) {
    return appointmentStatus.name;
  }
}
