import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/router.gr.dart';
import '../services/locator.dart';
import '../services/authentication.dart';
import '../widgets/dialogBox.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  String username = 'MP', email = 'name@email.com';

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(username: username, email: email, thirdLine: ''),
            createDrawerItem(
                text: 'About',
                onTap: () {
                }),
            createDrawerItem(
                text: 'Profile',
                onTap: () {
                }),
            createDrawerItem(
                text: 'Logout',
                onTap: () async {
                  Navigator.of(context).pop();
                  await logoutUser();
                }),
          ],
        ),
      ),
    );
  }

  Future logoutUser() async {
    await showAskYesNoDialog(
      context: context,
      title: 'Logout user',
      body: 'Do you want to logout?',
      handler1: () async {
        var hasLoggedInUser = await _authenticationService.signOutUser();
        if (hasLoggedInUser) {
          print('Nothing happens');
        } else {
          print('Account signed out');
          await _navigationService.navigateTo(Routes.loginViewRoute);
        }
      },
      handler2: () {},
    );
  }
}


Widget createDrawerHeader({String username, String email, String thirdLine=''}) {
  return Container(   //DrawerHeader(
    height: 170,
    decoration: BoxDecoration(color: Colors.orange),

    child: Row(
      children: <Widget>[

        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(child: Text(
              username.substring(0,2).toUpperCase(),
            ),
              radius: 40.0,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(username),
              SizedBox(height: 3,),
              Text(email),
              SizedBox(height: 3,),
              Text(thirdLine),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[

        Text(
          text,

        ),
      ],
    ),
    onTap: onTap,
  );
}
