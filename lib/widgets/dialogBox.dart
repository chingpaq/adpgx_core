import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/locator.dart';
import '../constants.dart';
import 'dart:io';

class DialogBox {

  static void showOkDialog(String title, String text)async{
    DialogService _dialogService = locator<DialogService>();
    await _dialogService.showDialog(
      title: title,
      description: text,
      dialogPlatform: Platform.isIOS ? DialogPlatform.Cupertino : DialogPlatform.Material,
    );
  }


}

enum ConfirmAction { CANCEL, ACCEPT }

Future showAskYesNoDialog({BuildContext context, String title, String body, Function handler1, Function handler2}) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return Platform.isIOS ? CupertinoAlertDialog(
        title: Text(title, style: kListViewMainHeaderStyle),
        content: Text(
            body
        ),
        actions: [
          FlatButton(
            child: Text('No',style: kLabelsTextHeaderStyle),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
              handler2();
            },
          ),
          FlatButton(
            child: Text('Yes', style: kLabelsTextHeaderStyle),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
              handler1();
            },
          )
        ],
      )
          :
      AlertDialog(
        title: Text(title, style: kListViewMainHeaderStyle),
        content: Text(
            body
        ),
        actions: [
          FlatButton(
            child: Text('No',style: kLabelsTextHeaderStyle),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
              handler2();
            },
          ),
          FlatButton(
            child: Text('Yes', style: kLabelsTextHeaderStyle),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
              handler1();
            },
          )
        ],
      );
    },
  );
}


