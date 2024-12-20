import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riada/src/features/common/entity/json_converter/firestore_timestamp_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/geopoint_json_converter.dart';
import 'package:riada/src/features/common/entity/json_converter/user_status_json_converter.dart';
import 'package:riada/src/features/user/entity/related_user.dart';
import 'package:riada/src/features/user/entity/user_status.dart';
import 'package:riada/src/utils/constants.dart';

part 'user.g.dart';

@JsonSerializable()
@FirestoreTimestampJsonConverter()
@UserStatusJsonConverter()
@GeoPointJsonConverter()
class User {
  final String id;
  final String avatar;
  final String nickName;
  final String? mail;
  final String? phone;
  final GeoPoint? location;
  final List<String> devices;
  final List<String> favoritesSports;
  final Timestamp createdDate;
  final UserStatus? status;

  const User({
    required this.id,
    required this.avatar,
    required this.nickName,
    required this.mail,
    required this.phone,
    required this.location,
    required this.devices,
    required this.favoritesSports,
    required this.createdDate,
    required this.status,
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
        avatar: Constants.defaultAvatar,
        nickName: "",
        mail: email,
        phone: phoneNumber,
        location: Constants.defaultCity.geoPoint,
        devices: devices,
        favoritesSports: [],
        createdDate: Timestamp.now(),
        status: UserStatus.signed,
      );

  Map<String, dynamic> toJson() => _$UserToJson(this);

  RelatedUser toRelated() {
    return RelatedUser(
      userId: id,
      userNickName: nickName,
      userAvatar: avatar,
    );
  }
}
