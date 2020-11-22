import 'package:provider_architecture/_base_viewmodels.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/locator.dart';
import '../services/authentication.dart';
import '../services/firestore.dart';
import '../services/router.gr.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();

  void navigateToHomePage() {
    _navigationService.back();
  }

  Future gotoHomePage() async{
    return await _navigationService.navigateTo(Routes.homeViewRoute);
  }

  Future<dynamic> goBack() async {
    return _navigationService.back();
  }

  Future<String> registerUser(
      {String userName,
      String email,
      String password,
      String firstName,
      String lastName}) async {
    try {
      final newUser = await _authenticationService.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (newUser != null) {
        await _fireStoreService.addUser(
          firstName: firstName,
          lastName: lastName,
          userName: userName,
          uID: newUser.user.uid,
        );
        return "Email was successfully registered";
      }
    } catch (e) {
      return e.toString();
    }
    return "Ok";
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

  Future<String> updatePasswordOfCurrentUser(
      String password, String currentPassword) async {
    final currentUser = _authenticationService.firebaseAuth.currentUser;
    try {
      var results = await loginUser(currentUser.email, currentPassword.trim());
      if (results != 'Ok') {
        return results;
      }
    } catch (e) {
      return e.toString();
    }

    try {
      await currentUser.updatePassword(password);
    } catch (e) {
      return e.toString();
    }
    return "Change password successful";
  }

  Future logoutUser() async {
    var hasLoggedInUser = await _authenticationService.signOutUser();
    if (hasLoggedInUser) {
      print('Nothing happens');
    } else {
      print('Account signed out');
      _navigationService.back();
    }
  }
}
