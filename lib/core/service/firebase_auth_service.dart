import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/custom_exception.dart';

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
}
