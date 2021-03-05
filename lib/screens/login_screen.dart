import 'package:flutter/material.dart';
import 'package:moon_list/api/api_connect.dart';
import 'package:moon_list/components/constraints.dart';
import 'package:moon_list/components/password_field_container.dart';
import 'package:moon_list/components/rounded_button.dart';
import 'package:moon_list/components/text_field_container.dart';
import 'package:moon_list/screens/tasks_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  SharedPreferences sharedPreferences;

  APIConnect apiConnect = APIConnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Log In',
                  style: kHeaderBoldTextStyle,
                ),
              ),
              TextFieldContainer(
                iconData: Icons.face,
                text: 'Enter your e-mail address',
                controller: emailController,
              ),
              SizedBox(
                height: 20.0,
              ),
              PasswordFieldContainer(
                controller: passwordController,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 45.0),
                child: RoundedButton(
                  color: kDarkColor,
                  onPressed: () async {
                    apiConnect.logIn(
                        emailController.text, passwordController.text);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TasksScreen();
                        },
                      ),
                    );
                  },
                  text: 'Log In',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
