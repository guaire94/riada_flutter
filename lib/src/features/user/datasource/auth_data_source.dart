import 'package:riada/src/features/user/datasource/exceptions/login_failed_exception.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:injectable/injectable.dart';

@injectable
class AuthDataSource {
  // MARK: - Public
  Auth.User? getUser() {
    return Auth.FirebaseAuth.instance.currentUser;
  }

  Future signOut() async {
    await Auth.FirebaseAuth.instance.signOut();
  }

  Future deleteAccount() async {
    await Auth.FirebaseAuth.instance.currentUser?.delete();
    await Auth.FirebaseAuth.instance.signOut();
  }

  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await Auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = userCredential.user?.uid;

      if (userId != null) return userId;

      throw LoginFailedException();
    } catch (_) {
      rethrow;
    }
  }

  Future sendForgetPasswordEmail({
    required String email,
  }) async {
    await Auth.FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
