import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:template_flutter_app/src/features/common/datasource/base_data_source.dart';
import 'package:template_flutter_app/src/features/user/datasource/exceptions/login_failed_exception.dart';
import 'package:template_flutter_app/src/features/user/entity/social_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@injectable
class AppleSignInDataSource extends BaseDataSource {
  Future<SocialUser> signIn() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      final email = userCredential.user?.email;
      final userId = userCredential.user?.uid;
      if (userId != null && email != null)
        return SocialUser(
          userId: userId,
          email: email,
        );

      throw LoginFailedException();
    } catch (_) {
      rethrow;
    }
  }

  // MARK: - Privates
  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
