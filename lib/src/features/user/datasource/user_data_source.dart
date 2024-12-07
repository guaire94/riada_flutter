import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:riada/src/features/common/datasource/base_firestore_data_source.dart';
import 'package:riada/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:riada/src/features/common/entity/json_converter/user_status_json_converter.dart';
import 'package:riada/src/features/user/entity/social_user.dart';
import 'package:riada/src/features/user/entity/user.dart';
import 'package:riada/src/features/user/entity/user_status.dart';
import 'package:riada/src/utils/city.dart';
import 'package:riada/src/utils/file_extension.dart';

@injectable
class UserDataSource extends BaseFirestoreDataSource {
  UserDataSource({required super.envConfigurationDataSource});

  // MARK: Public
  Future<void> createUser({
    required SocialUser socialUser,
  }) async {
    final token = await FirebaseMessaging.instance.getToken();
    final user = User.toDefault(
      id: socialUser.userId,
      email: socialUser.email,
      phoneNumber: socialUser.phoneNumber,
      devices: [if (token != null) token],
    );
    await userReference(socialUser.userId).set(
      user.toJson(),
    );
  }

  Future<User> getUserByReference({
    required DocumentReference reference,
  }) async {
    final document = await reference.get();
    final data = document.data() as Map<String, Object?>?;

    if (data == null) {
      throw new NoDataAvailableException();
    }

    return User.fromJson(data);
  }

  Future<void> updateConnectionDate({required String userId}) async {
    userReference(userId).update({
      "lastConnection": Timestamp.now(),
    });
  }

  Future<void> updateNotificationToken({required String userId}) async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      userReference(userId).update({
        "devices": FieldValue.arrayUnion([token]),
      });
    } catch (_) {
      return;
    }
  }

  Future<void> updateAdditionalProfileInformation({
    required String userId,
    required String name,
    required File? profile,
    required String? email,
    required String? phoneNumber,
    required UserStatus status,
  }) async {
    Map<String, String> map = {};

    map["nickName"] = name;
    map["status"] = UserStatusJsonConverter().toJson(status);
    if (email != null && email.isNotEmpty) map["mail"] = email;
    if (phoneNumber != null && phoneNumber.isEmpty == false)
      map["phone"] = phoneNumber;
    if (profile != null)
      map["avatar"] = await profile.uploadImage(reference: userStorage(userId));

    await userReference(userId).update(map);
  }

  Future<void> updateCity({
    required String userId,
    required City city,
  }) async {
    Map<String, GeoPoint> map = {};

    map["location"] = city.geoPoint;

    await userReference(userId).update(map);
  }

  Future<void> updateProfilePicture({
    required String userId,
    required File profile,
  }) async {
    Map<String, String> map = {};

    map["avatar"] = await profile.uploadImage(reference: userStorage(userId));

    await userReference(userId).update(map);
  }

  Future<void> desactiveAccount({
    required String userId,
  }) async {
    await userReference(userId).update({
      "status": UserStatusJsonConverter().toJson(UserStatus.inactive),
    });
  }
}
