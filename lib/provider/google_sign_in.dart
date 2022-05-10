import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_db_api/main.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user {
    _user!;
    return null;
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await MyApp.auth.signInWithCredential(credential).then((value) {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(MyApp.auth.currentUser!.uid)
            .set({
          'email': MyApp.auth.currentUser!.email,
          'user': MyApp.auth.currentUser!.displayName,
          'photo': MyApp.auth.currentUser!.photoURL,
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    MyApp.auth.signOut();
  }
}
