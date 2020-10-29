import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User user;

  Future<bool> isUserLoggedIn() async {
    //user = await firebaseAuth.currentUser;
    return user != null;
  }
  Future <bool> signOutUser()  async{
    await FirebaseAuth.instance.signOut();
    //user = await firebaseAuth.currentUser();
    return user != null;
  }
}
