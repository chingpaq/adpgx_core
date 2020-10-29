import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

import '../views/home/loginView.dart';
import '../views/home/signUpView.dart';
// use
// flutter pub run build_runner watch --delete-conflicting-outputs
// to generate the boilerplates

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(
        page: LoginView,
        initial: false,
        fullscreenDialog: false,
        name: "loginViewRoute"),
  ],
)
class $CustomRouter {}
