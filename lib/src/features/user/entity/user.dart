import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/user_status_json_converter.dart';
import 'package:template_flutter_app/src/features/user/entity/user_status.dart';
import 'package:template_flutter_app/src/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@UserStatusJsonConverter()
class User {
  final String id;
  final String name;
  final String? email;
  final String? phone;
  final UserStatus status;
  final String avatar;
  final String city;
  final String country;
  final List<String> devices;
  final Timestamp createdDate;
  final Timestamp lastConnection;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.avatar,
    required this.city,
    required this.country,
    required this.devices,
    required this.createdDate,
    required this.lastConnection,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.toDefault({
    required String id,
    required String? email,
    required String? phoneNumber,
    required List<String> devices,
  }) =>
      User(
        id: id,
        name: "",
        email: email,
        phone: phoneNumber,
        status: UserStatus.signed,
        avatar: TemplateConstants.defaultAvatar,
        city: TemplateConstants.city,
        country: TemplateConstants.country,
        devices: devices,
        createdDate: Timestamp.now(),
        lastConnection: Timestamp.now(),
      );

  factory User.empty({required String id}) => User(
        id: id,
        name: "",
        email: "",
        phone: "",
        status: UserStatus.signed,
        avatar: TemplateConstants.defaultAvatar,
        city: TemplateConstants.city,
        country: TemplateConstants.country,
        devices: [],
        createdDate: Timestamp.now(),
        lastConnection: Timestamp.now(),
      );

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
