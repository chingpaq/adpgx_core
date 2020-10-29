import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void setupLocator() => $initGetIt(locator);

/// The type of snackbar to show
enum SnackBarType { blueAndYellow, greenAndRed }

void setupSnackBarUi() {

  final service = locator<SnackbarService>();
  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.orange,
    textColor: Colors.white,
    mainButtonTextColor: Colors.white,
  ));

}
