import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

const kAppName = 'DailyGains';
const kCopyright = 'Copyright 2020';
const kLinkedIn = 'linkedin.com/in/chingpaq';
const kGitHub = 'github.com/chingpaq';


const kDeveloper ='AN APP DEVELOPED BY CHING PARUNGAO';

const kFirebase = 'Hello World';
const String kFirebaseClientId = '123';
const String kFirebaseRedirectURL =
    'https://www.facebook.com/connect/login_success.html';
const String kFacebookAPIURL = 'https://www.facebook.com/dialog/oauth?client_id=$kFirebaseClientId&redirect_uri=$kFirebaseRedirectURL&response_type=token&scope=email,public_profile,';
const String kPrivacyURL = 'https://mbparungao6.wixsite.com/adpgxsoftware/privacy';
const String kDbName = 'dailyGains.db';
const String kSqlScriptAssets = 'assets/db/script.sql';
const int kMaxSearchStringCount = 2;
const int kSelected = 1;
const int kNotSelected = 0;
const int kFirstTab = 1;
const int kSecondTab = 2;


const kLargestFontSize = 30.0;
const kGeneralFontSize = 16.0;
const kMediumFontSize = 15.0;
const kGeneralSubFontSize = 14.0;
const kSmallestFontSize = 10.0;
const kAppBarTitleFontSize = 18.0;

const String kPacifico = 'Pacifico';
const String kUbuntu = 'Ubuntu';
const String kLato = 'Lato';
const String kOpenSans = 'OpenSans';
const String kRoboto = 'Roboto';
const String kNotoSansJP = 'NotoSansJP';
//
// TextStyle kDailyGainsLogoTitlesInOrange = GoogleFonts.pacifico(
//     textStyle: TextStyle(
//       color: Colors.orange,
//       fontSize: kLargestFontSize,
//     ));
//
// TextStyle kDailyGainsLogoTitlesInWhite = GoogleFonts.pacifico(
//     textStyle: TextStyle(
//       color: Colors.white,
//       fontSize: kLargestFontSize,
//     ));
//
// TextStyle kDailyGainsLogoThemeForAppBarInWhite = GoogleFonts.pacifico(
//     textStyle: TextStyle(
//       color: Colors.white,
//       fontSize: kAppBarTitleFontSize,
//     ));
//
// TextStyle kDailyGainsLogoThemeForAppBar = GoogleFonts.pacifico(
//     textStyle: TextStyle(
//       fontSize: kAppBarTitleFontSize,
//     ));

TextStyle kBiggerViewsLabelStyles = GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: kAppBarTitleFontSize,
    ));

TextStyle kBiggerViewsLabelStylesInOrange = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Color(0xfff7892b),
      fontSize: kAppBarTitleFontSize,
    ));

TextStyle kBiggerViewsLabelStylesInWhite = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: kAppBarTitleFontSize,
    ));

TextStyle kListViewMainHeaderStyle = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: kGeneralFontSize,
    ));

TextStyle kListViewMainHeaderStyleInWhite = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: kGeneralFontSize,
    ));

TextStyle kRegularTextHeaderStyle = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.black54,
      fontSize: kGeneralSubFontSize,
    ));

TextStyle kLabelsTextHeaderStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    color: Colors.black54,
    fontSize: kMediumFontSize,
  ),
);

TextStyle kLabelsTextHeaderStyleInOrange = GoogleFonts.lato(
  textStyle: TextStyle(
    color: Colors.orange,
    fontSize: kMediumFontSize,
  ),
);

TextStyle kLabelsTextHeaderStyleInWhite = GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: kMediumFontSize,
    ));

TextStyle kLabelsTextHeaderStyleSmallest = GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: kSmallestFontSize,
  ),
);

TextStyle kLabelsTextHeaderStyleSmallestInWhite = GoogleFonts.lato(
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: kSmallestFontSize,
  ),
);

Map<int, Color> kWhiteColor = {
  50: Color(0xffffffff),
  100: Color(0xffffffff),
  200: Color(0xffffffff),
  300: Color(0xffffffff),
  400: Color(0xffffffff),
  500: Color(0xffffffff),
  600: Color(0xffffffff),
  700: Color(0xffffffff),
  800: Color(0xffffffff),
  900: Color(0xffffffff),
};

const String kAccountsTable = "accounts";
const String kTransactionsTable = "transactions";
const String kBudgetsTable = "budget";
const String kToDoTable = 'toDo';

enum kTypeDay {
  Yesterday,
  Today,
  Other,
}

enum kSelectedTabInTransactions {
  None,
  Actual,
  Projections,
}


NumberFormat kMoneyFormatter = NumberFormat("#,###.00");
DateFormat kDateFormatDateFullDateLongMonth = DateFormat('MMMM dd, yyyy');
DateFormat kDateFormatDateFullDateShortMonth = DateFormat('MMM dd, yyyy');
DateFormat kDateFormatDateMonthDayOnly = DateFormat('MMM dd, yyyy HH:mm');
DateFormat kDateFormatDateCompleteMilitary = DateFormat('MMM dd, yyyy HH:mm');
DateFormat kDateFormatDateCompleteAMPM = DateFormat('MMM dd, yyyy hh:mm a');

const kTextEntryFieldRequired = 0;
const kTextEntryFieldNotRequired = 1;
const kTextDoubleEntryFieldRequired = 2;
const kTextEntryFieldMultiLined = 3;
const kNumericEntryFieldRequired = 4;
const kNumericEntryFieldNotRequired = 5;
const kDropDownEntryField = 6;
const kDatePicker = 7;
const kSwitchField = 8;
const kOptionField = 9;
const kSecuredPasswordEntry = 10;
const kDoubleSecuredPasswordEntry = 11;
const kCountryPicker = 12;

const kSnackBarDurationInSecs = 6;
const kTrue = 1;
const kFalse = 0;


enum kCategories {
  investment,
  creditCard,
  cash,
  checking,
  general,
  income,
  savings,
  shopping,
  groceries,
  interest,
  food,
  service,
  transportation,
  communications,
  entertainment,
  others,
  devices,
  utilities,
  insurance,
  loans,
  leisure,
  allowance,
  rent,
  payment
}
enum kSnackBarType { blueAndYellow, greenAndRed }