import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../constants.dart';


Widget formBuilderGroupedCheckbox(
    {String option1,
      String option2,
      String groupedTitle,
      @required Function handler}) {
  return Container(
    child: FormBuilderCheckboxGroup(
      attribute: groupedTitle,
      decoration: InputDecoration(
          labelText: groupedTitle, labelStyle: kLabelsTextHeaderStyle),
      onChanged: (_) {
        handler();
      },
      options: [
        FormBuilderFieldOption(
          value: option1,
          child: Text(
            option1,
            style: kLabelsTextHeaderStyle,
          ),
        ),
        FormBuilderFieldOption(
          value: option2,
          child: Text(
            option2,
            style: kLabelsTextHeaderStyle,
          ),
        ),
      ],
    ),
  );
}

Widget formBuilderSingleCheckbox(
    {@required String title, @required Function handler}) {
  return Container(
    child: FormBuilderCheckbox(
      label: Text(
        title,
        style: kLabelsTextHeaderStyle,
      ),
      attribute: title,
      onChanged: (_) {
        handler();
      },
    ),
  );
}

Widget formBuilderDropDownEntryField(
    {@required String title,
      @required List<String> list,
      @required Function T,
      @required Function handler,
      bool isRequired = true}) {
  return Container(
    color: Colors.white,
    child: FormBuilderDropdown(
      attribute: title,
      onChanged: (value) {
        handler();
        T(value);
      },
      decoration:
      InputDecoration(labelText: title, labelStyle: kLabelsTextHeaderStyle),
      validators: [
        if (isRequired == true) FormBuilderValidators.required(),
      ],
      items: list
          .map((title) => DropdownMenuItem(value: title, child: Text("$title")))
          .toList(),
    ),
  );
}

Widget formBuilderEntryField(
    {@required String title,
      bool isPassword = false,
      bool isReadOnly = false,
      isMultiLined = false,
      isNumeric = false,
      isRequired = false,
      isEmail = false,
      isURL = false,
      int maxLines = 1,
      @required Function handler}) {
  return Container(
      color: Colors.white, //Color(0xfff3f3f4),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderTextField(
            attribute: title,
            readOnly: isReadOnly,
            maxLines: maxLines,
            showCursor: true,
            keyboardType: isNumeric
                ? TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            )
                : TextInputType.text,
            decoration: InputDecoration(
              labelText: title,
              //hintText: 'Press Done after entering text',
              labelStyle: kLabelsTextHeaderStyle,
            ),
            validators: [
              if (isRequired) FormBuilderValidators.required(),
              if (isURL) FormBuilderValidators.url(),
              if (isNumeric) FormBuilderValidators.numeric(),
            ],
            onFieldSubmitted: (_) {
              handler();
            },
            onChanged: (_) {
              handler();
            },
          ),
        ],
      ));
}

Widget formBuilderDatePicker(
    {@required String title, @required Function handler, bool withTime=false}) {
  return Container(
      color: Colors.white, // Color(0xfff3f3f4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              accentColor: Colors.yellow,
              primarySwatch: Colors.orange,
            ),
            child: FormBuilderDateTimePicker(
              attribute: title,
              inputType: withTime == true ? InputType.both : InputType.date,
              onChanged: (value) {
                handler();
              },
              format: withTime == true ? DateFormat("MMM dd, yyyy HH:MM") : DateFormat("MMM dd, yyyy"),
              decoration: InputDecoration(
                  labelText: title, labelStyle: kLabelsTextHeaderStyle),
            ),
          ),
        ],
      ));
}
