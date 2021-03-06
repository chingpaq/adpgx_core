import 'package:stacked_services/stacked_services.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/router.gr.dart';
import '../services/locator.dart';
import '../services/authentication.dart';
import '../widgets/customWebView.dart';
import '../constants.dart';
import '../services/firestore.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();

  Future<dynamic> navigateToHomePage() async{
    return _navigationService.back();
  }

  Future<dynamic> navigateToSignUpPage() async{
    return await _navigationService.navigateTo(Routes.signUpViewRoute);
  }

  Future gotoLoginPage() async{
    return await _navigationService.navigateTo(Routes.loginViewRoute);
  }

  Future gotoHomePage() async{
    return await _navigationService.navigateTo(Routes.homeViewRoute);
  }

  Future<String> loginUser(String email, String password) async {
    try {
      final user = await _authenticationService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        return "Ok";
      }
    } catch (e) {
      return e.toString();
    }
    return "Ok";
  }

  Future<bool> handleStartUpLogic() async {
    await _authenticationService.initFirebase();
    _fireStoreService.initFireStore();

    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (hasLoggedInUser) {
      print('Firebase account is logged in');
      return true;
    } else {
      print('There are no Firebase account logged in');
      return false;
    }
  }

  Future<String> loginUserViaFacebook(
      String email, String password, BuildContext context) async {
    print("Login via Facebook");
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CustomWebView(
            selectedUrl:
            kFacebookAPIURL,
          ),
          maintainState: true),
    );
    if (result != null) {
      try {
        final facebookAuthCred =
        FacebookAuthProvider.credential(result);
        final user = await _authenticationService.firebaseAuth
            .signInWithCredential(facebookAuthCred);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('username',user.user.displayName );
        await prefs.setString('email', user.user.email);

      } catch (e) {
        return e.toString();
      }
    }else {
      return "Failed to login via Facebook";
    }

    return "Ok";
  }
}
