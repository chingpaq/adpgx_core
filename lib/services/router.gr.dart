// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/home/homeView.dart';
import '../views/home/loginView.dart';
import '../views/home/signUpView.dart';

class Routes {
  static const String homeViewRoute = '/';
  static const String loginViewRoute = '/login-view';
  static const String signUpViewRoute = '/sign-up-view';
  static const all = <String>{
    homeViewRoute,
    loginViewRoute,
    signUpViewRoute,
  };
}

class CustomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeViewRoute, page: HomeView),
    RouteDef(Routes.loginViewRoute, page: LoginView),
    RouteDef(Routes.signUpViewRoute, page: SignUpView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
        fullscreenDialog: false,
      );
    },
    LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(
          key: args.key,
          title: args.title,
        ),
        settings: data,
        fullscreenDialog: false,
      );
    },
    SignUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
        fullscreenDialog: false,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key key;
  final String title;
  LoginViewArguments({this.key, this.title});
}
