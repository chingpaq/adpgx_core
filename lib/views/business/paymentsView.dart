import 'package:adpgx_core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


import '../../models/appState.dart';
import '../../widgets/drawerMenu.dart';

class PaymentsView extends StatefulWidget {
  final Store store;
  PaymentsView({this.store});
  @override
  _PaymentsViewState createState() => _PaymentsViewState();
}

class _PaymentsViewState extends State<PaymentsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: StoreConnector<AppState, Map>(
            converter: (store) => store.state.coreMap,
            builder: (context, value) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(kAppName),
                ),
                drawer: DrawerWidget(),
                body: Center(
                  child: StoreConnector<AppState, AppState>(
                      converter: (store) => store.state,
                      builder: (context, value) {
                        return Text('${value.coreMap['Test']}');
                      }),
                ),
              );
            }),
      ),
    );
  }
}
