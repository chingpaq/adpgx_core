import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../viewModels/signUpViewModel.dart';
import '../../constants.dart';
import '../../widgets/snackBar.dart';
import 'loginView.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context, 'back');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: kLabelsTextHeaderStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _registerNowButton(SignUpViewModel model, BuildContext context) {
    return InkWell(
        onTap: () async {
          if (passwordController.text == verifyPasswordController.text) {
            var result = await model.registerUser(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              userName: usernameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('username', usernameController.text.trim());
            await prefs.setString('email', emailController.text.trim());
            await prefs.setString('pilot', 'true');

            CustomSnackBar.showSnackBar(
                title: 'Registration',
                message: result,
                handler2: () {},
                handler: () {});

            passwordController.clear();
            verifyPasswordController.clear();

            if (result.contains('Email was successfully registered')) {
              emailController.clear();
              usernameController.clear();
              Navigator.pop(context, 'back');
              model.gotoHomePage();
            }
          } else {
            passwordController.clear();
            verifyPasswordController.clear();

            CustomSnackBar.showSnackBar(
                title: 'Registration',
                message: 'Passwords does not match',
                handler2: () {},
                handler: () {});
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)])),
          child: Text(
            'Register Now',
            style: kBiggerViewsLabelStylesInWhite,
          ),
        ));
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginView()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
          body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80),
                    _entryField("First Name", firstNameController),
                    _entryField("Last Name", lastNameController),
                    _entryField("Username", usernameController),
                    _entryField("Email Address", emailController),
                    _entryField("Password", passwordController,
                        isPassword: true),
                    _entryField("Verify Password", verifyPasswordController,
                        isPassword: true),
                    SizedBox(
                      height: 20,
                    ),
                    _registerNowButton(model, context),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      )),
    );
  }
}
