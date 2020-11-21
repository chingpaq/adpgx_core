import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationService {
  FirebaseAuth firebaseAuth;

  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    firebaseAuth = FirebaseAuth.instance;
  }

  Future<bool> isUserLoggedIn() async {
    var user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<bool> signOutUser() async {
    await FirebaseAuth.instance.signOut();
    var user = firebaseAuth.currentUser;
    return user != null;
  }
}
