import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

import '../views/home/loginView.dart';
import '../views/home/signUpView.dart';
import '../views/home/homeView.dart';

// use
// flutter pub run build_runner watch --delete-conflicting-outputs
// to generate the boilerplates

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(
        page: HomeView,
        initial: false,
        fullscreenDialog: false,
        name: "homeViewRoute"),
    CupertinoRoute(
        page: LoginView,
        initial: true,
        fullscreenDialog: false,
        name: "loginViewRoute"),
    CupertinoRoute(
        page: SignUpView,
        initial: false,
        fullscreenDialog: false,
        name: "signUpViewRoute"),
  ],
)
class $CustomRouter {}
