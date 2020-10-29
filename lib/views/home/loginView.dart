import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
//import 'signUpView.dart';
import '../../constants.dart';
import '../../widgets/snackBar.dart';
import '../../viewModels/loginViewModel.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String username;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context, "hello");
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
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
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

  Widget _loginButton(Function action) {
    return InkWell(
        onTap: () => action(),
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
            'Login',
            style: kBiggerViewsLabelStylesInWhite,
          ),
        ));
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton(Function action) {
    return InkWell(
        onTap: () => action(),
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff1959a9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: Text('f',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff2872ba),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: Text('Log in with Facebook',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SignUpView()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
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

  Widget _appTitle() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      child: Text(
        kAppName,
        style: kDailyGainsLogoTitlesInOrange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
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
                        SizedBox(height: height * .2),
                        _appTitle(),
                        SizedBox(height: 20),
                        _entryField("Email Address", emailController),
                        _entryField("Password", passwordController,
                            isPassword: true),
                        SizedBox(height: 20),
                        _loginButton(() async {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            CustomSnackBar.showSnackBar(
                                title: 'Login',
                                message:
                                'Please enter your email address and password',
                                handler2: () {},
                                handler: () {},
                                buttonTitle: 'Ok');

                          } else {
                            var results = await model.loginUser(
                                emailController.text.trim(),
                                passwordController.text.trim());
                            if (results == "Ok") {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setString('email', emailController.text.trim());
                              if (prefs.getString('username')==null || prefs.getString('username')=='') {
                                await prefs.setString(
                                    'username', emailController.text.trim());
                                await prefs.setString(
                                    'currency', 'USD');
                              }
                              emailController.clear();
                              passwordController.clear();
                              model.navigateToHomePage();
                            } else {

                              if (results.contains('WRONG_PASSWORD'))
                                CustomSnackBar.showSnackBar(
                                    title: 'Error',
                                    message:
                                    'You have entered an incorrect password',
                                    handler2: () {},
                                    handler: () {},
                                    buttonTitle: 'Ok');
                              else if (results.contains('INVALID_EMAIL'))
                                CustomSnackBar.showSnackBar(
                                    title: 'Error',
                                    message:
                                    'You have entered an incorrect email address',
                                    handler2: () {},
                                    handler: () {},
                                    buttonTitle: 'Ok');
                              else if (results.contains('ERROR_USER_NOT_FOUND'))
                                CustomSnackBar.showSnackBar(
                                    title: 'Error',
                                    message:
                                    'Email is not registered',
                                    handler2: () {},
                                    handler: () {},
                                    buttonTitle: 'Ok');
                              else
                                CustomSnackBar.showSnackBar(title:'Error', message: results, handler2: (){}, handler: (){},buttonTitle: 'Ok');

                            }
                          }
                        }),

                        if (Platform.isIOS==false) _divider(),
                        if (Platform.isIOS==false) _facebookButton(() async {
                          var results = await model.loginUserViaFacebook(
                            emailController.text,
                            passwordController.text,
                            context,
                          );
                          results == "Ok"
                              ? model.navigateToHomePage()
                              : CustomSnackBar.showSnackBar(title:'Errors' , message: results, handler2:(){} , handler: (){});


                          //DialogBox.showOkDialog("Error", results);
                        }),
                        SizedBox(height: height * .055),
                        _createAccountLabel(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: _backButton(),
                ),
              ],
            ),
          )),
    );
  }
}
