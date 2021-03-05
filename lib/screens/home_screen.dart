import 'package:flutter/material.dart';
import 'package:moon_list/components/constraints.dart';
import 'package:moon_list/screens/login_screen.dart';
import 'package:moon_list/components/rounded_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              child: Icon(
                Icons.nights_stay,
                size: 50.0,
                color: kAccentColor,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Text(
                "Let's organize your to do's with moon list!",
                style: kHeaderBoldTextStyle,
              ),
            ),
            RoundedButton(
              color: kPrimaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
              text: 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
