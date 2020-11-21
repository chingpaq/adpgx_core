import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stacked_services/stacked_services.dart';

import 'redux/reducers.dart';
import 'models/appState.dart';
import 'services/locator.dart';
import 'views/home/homeView.dart';
import 'constants.dart';
import 'services/router.gr.dart';

void main() {
  setupLocator();
  setupSnackBarUi();
  runApp(MyApp());
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
        initialRoute: Routes.homeViewRoute,
        onGenerateRoute: CustomRouter().onGenerateRoute,

        // onGenerateInitialRoutes: (route) {
        //   return [
        //     MaterialPageRoute(
        //       builder: (_) => HomeView(
        //         store: store,
        //       ),
        //     ),
        //   ];
        // },
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
