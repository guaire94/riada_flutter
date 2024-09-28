import 'package:template_flutter_app/src/features/common/datasource/base_data_source.dart';
import 'package:template_flutter_app/src/features/user/datasource/exceptions/login_failed_exception.dart';
import 'package:template_flutter_app/src/features/user/entity/social_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@injectable
class GoogleSignInDataSource extends BaseDataSource {
  Future<SocialUser> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: [
        'email',
      ]).signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final email = userCredential.user?.email;
      final userId = userCredential.user?.uid;
      if (userId != null && email != null)
        return SocialUser(
          userId: userId,
          email: email,
        );

      throw LoginFailedException();
    } catch (e) {
      rethrow;
    }
  }
}
