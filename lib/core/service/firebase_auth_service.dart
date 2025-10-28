import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'هذا البريد الإلكتروني مستخدم بالفعل.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الإلكتروني غير صالح.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
          message: 'إنشاء الحسابات بالبريد الإلكتروني غير مفعّل حالياً.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message:
              'فشل الاتصال بالشبكة. تأكد من اتصالك بالإنترنت وحاول مرة أخرى.',
        );
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
          message: 'تم إرسال العديد من المحاولات. حاول مرة أخرى لاحقاً.',
        );
      } else if (e.code == 'internal-error') {
        throw CustomException(message: 'حدث خطأ داخلي في الخادم. حاول لاحقاً.');
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ: ${e.toString()}');
    }
    throw CustomException(message: 'حدث خطأ غير معروف.');
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'لا يوجد مستخدم مسجل بهذا البريد الإلكتروني.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الإلكتروني غير صالح.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(message: 'تم تعطيل هذا الحساب من قبل الإدارة.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message:
              'فشل الاتصال بالشبكة. تأكد من اتصالك بالإنترنت وحاول مرة أخرى.',
        );
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
          message: 'محاولات كثيرة جدًا. حاول مرة أخرى لاحقًا.',
        );
      }
    } catch (e) {
      throw CustomException(message: 'حدث خطأ: ${e.toString()}');
    }
    throw CustomException(message: 'حدث خطأ غير معروف.');
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
