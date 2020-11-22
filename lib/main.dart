import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:provider/provider.dart';

import 'redux/reducers.dart';
import 'models/appState.dart';
import 'services/locator.dart';
import 'constants.dart';
import 'services/router.gr.dart';
import 'services/dbHelper.dart';

void main() {
  setupLocator();
  setupSnackBarUi();
  //runApp(MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DBHelper(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: kAppName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loginViewRoute,
        onGenerateRoute: CustomRouter().onGenerateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
