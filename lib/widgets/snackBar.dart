import 'package:stacked_services/stacked_services.dart';
import '../services/locator.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {

  static void showWarningSnackBar({String title,
    String message,
    Function handler,
    Function handler2,
    String buttonTitle}) {
    locator<SnackbarService>().showSnackbar(
      message: message,
      title: title,
      duration: Duration(seconds: kSnackBarDurationInSecs),
      onTap: (_) {
        handler();
      },
      mainButtonTitle: buttonTitle,
      onMainButtonTapped: () {
        handler2();
      },
    );
  }
  static void showSnackBar({String title,
    String message,
    Function handler,
    Function handler2,
    String buttonTitle}) {
    locator<SnackbarService>().showSnackbar(

      message: message,
      title: title,
      duration: Duration(seconds: kSnackBarDurationInSecs),
      onTap: (_) {
        handler();
      },
      mainButtonTitle: buttonTitle,
      onMainButtonTapped: () {
        handler2();
      },
    );
  }
  static void showYesNoSnackBar({@required BuildContext context,String title,
    String message,
    Function handler,
    Function handler2,
    String buttonTitle}) {
    locator<SnackbarService>().showSnackbar(
      message: message,
      title: title,
      duration: Duration(seconds: 15),
      onTap: (_) {

        handler();
      },
      mainButtonTitle: buttonTitle,
      onMainButtonTapped: () {

        handler2();
      },
    );
  }

}