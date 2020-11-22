import 'package:adpgx_core/services/firestore.dart';
import 'package:provider_architecture/_base_viewmodels.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/authentication.dart';
import '../services/locator.dart';
import '../services/router.gr.dart';


class HomeViewModel extends BaseViewModel {
  String _title = 'Welcome View';
  String get title => _title;

  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();

  Future<dynamic> goBack() async{
    return _navigationService.back();
  }

  Future gotoLoginPage() async{
    return await _navigationService.navigateTo(Routes.loginViewRoute);
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
}
