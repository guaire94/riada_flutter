import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flutter_app/src/features/common/datasource/base_data_source.dart';
import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:template_flutter_app/src/features/common/entity/json_converter/user_status_json_converter.dart';
import 'package:template_flutter_app/src/features/user/entity/social_user.dart';
import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/features/user/entity/user_status.dart';
import 'package:template_flutter_app/src/utils/file_extension.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDataSource extends BaseDataSource {
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
    final token = await FirebaseMessaging.instance.getToken();
    userReference(userId).update({
      "devices": FieldValue.arrayUnion([token]),
    });
  }

  Future<void> updateAdditionalProfileInformation({
    required String userId,
    required String name,
    required String country,
    required String city,
    required UserStatus status,
    required String? email,
    required String? phoneNumber,
    required File? profile,
  }) async {
    Map<String, String> map = {};

    map["name"] = name;
    map["status"] = UserStatusJsonConverter().toJson(status);
    map["country"] = country;
    map["city"] = city;
    if (email != null && email.isNotEmpty) map["email"] = email;
    if (phoneNumber != null && phoneNumber.isEmpty == false)
      map["phone"] = phoneNumber;
    if (profile != null)
      map["avatar"] = await profile.uploadImage(reference: userStorage(userId));

    await userReference(userId).update(map);
  }

  Future<void> updateCity({
    required String userId,
    required String country,
    required String city,
  }) async {
    Map<String, String> map = {};

    map["country"] = country;
    map["city"] = city;

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

  Future<void> updateStripeAccountId({
    required String userId,
    required String stripeAccountId,
  }) async {
    Map<String, String> map = {"stripeAccountId": stripeAccountId};
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
