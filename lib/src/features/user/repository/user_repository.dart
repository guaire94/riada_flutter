import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flutter_app/src/features/common/datasource/exceptions/no_data_available_exception.dart';
import 'package:template_flutter_app/src/features/common/entity/google_place/place.dart';
import 'package:template_flutter_app/src/features/user/datasource/auth_data_source.dart';
import 'package:template_flutter_app/src/features/user/datasource/exceptions/user_not_logged_exception.dart';
import 'package:template_flutter_app/src/features/user/datasource/user_data_source.dart';
import 'package:template_flutter_app/src/features/user/entity/social_user.dart';
import 'package:template_flutter_app/src/features/user/entity/user.dart';
import 'package:template_flutter_app/src/features/user/entity/user_status.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserRepository {
  final UserDataSource _userDataSource;
  final AuthDataSource _authDataSource;

  UserRepository({
    required UserDataSource userDataSource,
    required AuthDataSource authDataSource,
  })  : _userDataSource = userDataSource,
        _authDataSource = authDataSource,
        super();

  Future<User> getCurrentUser() async {
    final userRef = getCurrentUserReference();

    return await _userDataSource.getUserByReference(
      reference: userRef,
    );
  }

  DocumentReference getCurrentUserReference() {
    final authUser = _authDataSource.getUser();

    if (authUser == null) throw UserNotLoggedException();

    return getUserReference(authUser.uid);
  }

  Future<User> getUserById({required String userId}) async {
    final authUser = _authDataSource.getUser();

    if (authUser == null) throw NoDataAvailableException();

    final userRef = getUserReference(userId);

    return await _userDataSource.getUserByReference(
      reference: userRef,
    );
  }

  Future<User> getUserByReference(DocumentReference reference) async {
    return _userDataSource.getUserByReference(
      reference: reference,
    );
  }

  DocumentReference getUserReference(String userId) {
    return _userDataSource.userReference(userId);
  }

  Future createUser({
    required SocialUser socialUser,
  }) async {
    await _userDataSource.createUser(
      socialUser: socialUser,
    );
  }

  Future updateConnectionDate() async {
    _userDataSource.updateConnectionDate(userId: _userId);
  }

  Future updateNotificationToken() async {
    _userDataSource.updateNotificationToken(userId: _userId);
  }

  Future updateAdditionalProfileInformation({
    required String name,
    required Place place,
    required UserStatus status,
    required String? email,
    required String? phoneNumber,
    required File? profile,
  }) async {
    final user = await getCurrentUser();
    return _userDataSource.updateAdditionalProfileInformation(
      userId: _userId,
      name: name,
      city: place.city,
      country: place.country,
      status: status,
      email: email,
      phoneNumber: phoneNumber,
      profile: profile != user.avatar ? profile : null,
    );
  }

  Future updateCity({
    required Place place,
  }) async {
    return _userDataSource.updateCity(
      userId: _userId,
      city: place.city,
      country: place.country,
    );
  }

  Future updateProfilePicture({
    required File profile,
  }) async {
    return _userDataSource.updateProfilePicture(
      userId: _userId,
      profile: profile,
    );
  }

  String get _userId {
    final authUser = _authDataSource.getUser();

    if (authUser == null) throw NoDataAvailableException();

    return authUser.uid;
  }

  Future signOut() async {
    await _authDataSource.signOut();
  }

  bool isUserLogged() {
    return _authDataSource.getUser() != null;
  }

  Future<void> desactiveAccount() async {
    await _userDataSource.desactiveAccount(userId: _userId);
    await signOut();
  }
}
