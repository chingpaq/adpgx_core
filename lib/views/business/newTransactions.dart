import 'package:adpgx_core/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../widgets/drawerMenu.dart';

import '../../models/appState.dart';
import '../../widgets/customFormBuilders.dart';
import '../../constants.dart';
import 'package:provider/provider.dart';
import '../../services/dbHelper.dart';

class NewTransactionView extends StatefulWidget {
  final Store store;
  NewTransactionView({this.store});
  @override
  _NewTransactionViewState createState() => _NewTransactionViewState();
}

class _NewTransactionViewState extends State<NewTransactionView> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
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
                  actions: [
                    Padding(
                        padding: EdgeInsets.only(right: 30.0, top: 20),
                        child: GestureDetector(
                            onTap: () {
                              context.read<DBHelper>().testNotifier();
                            },
                            child: Text('Save', style: kLabelsTextHeaderStyleInWhite))),
                  ],
                ),
                drawer: DrawerWidget(),
                body: Center(
                  child: FormBuilder(
                    initialValue: {},
                    key: _fbKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        formBuilderEntryField(
                            title: 'Name', isRequired: true, handler: () {}),
                        SizedBox(
                          height: 100,
                        ),
                        StoreConnector<AppState, AppState>(
                            converter: (store) => store.state,
                            builder: (context, value) {
                              return Text('${value.coreMap['Test']}');
                            }),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(EditMapAction);
                  },
                  builder: (context, callback) {
                    return FloatingActionButton(
                      onPressed: callback,
                      child: Icon(Icons.add),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
