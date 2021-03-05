import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'components/constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: kScaffoldBackgroundColor,
        splash: Icon(
          Icons.nights_stay,
          size: 150.0,
        ),
        duration: 3000,
        nextScreen: Home(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
