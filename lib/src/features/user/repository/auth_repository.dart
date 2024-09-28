import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template_flutter_app/src/features/user/datasource/apple_sign_in_data_source.dart';
import 'package:template_flutter_app/src/features/user/datasource/auth_data_source.dart';
import 'package:template_flutter_app/src/features/user/datasource/google_sign_in_data_source.dart';
import 'package:template_flutter_app/src/features/user/entity/social_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final AuthDataSource _authDataSource;
  final GoogleSignInDataSource _googleSignInDataSource;
  final AppleSignInDataSource _appleSignInDataSource;

  AuthRepository({
    required AuthDataSource authDataSource,
    required GoogleSignInDataSource googleSignInDataSource,
    required AppleSignInDataSource appleSignInDataSource,
  })  : _authDataSource = authDataSource,
        _googleSignInDataSource = googleSignInDataSource,
        _appleSignInDataSource = appleSignInDataSource,
        super();

  Auth.User? getUser() {
    return _authDataSource.getUser();
  }

  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await _authDataSource.signInWithEmailPassword(
      email: email,
      password: password,
    );
  }

  Future<SocialUser> signInWithGoogle() async {
    return _googleSignInDataSource.signIn();
  }

  Future<SocialUser> signInWithApple() async {
    return _appleSignInDataSource.signIn();
  }

  Future<void> signOut() async {
    await _authDataSource.signOut();
  }

  Future<void> deleteAccount() async {
    await _authDataSource.deleteAccount();
  }

  Future<void> sendForgetPasswordEmail({
    required String email,
  }) async {
    return _authDataSource.sendForgetPasswordEmail(email: email);
  }

  DocumentReference userReference(String userId) {
    return _authDataSource.userReference(userId);
  }
}
