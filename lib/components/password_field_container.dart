import 'package:flutter/material.dart';
import 'constraints.dart';

class PasswordFieldContainer extends StatefulWidget {
  final TextEditingController controller;
  PasswordFieldContainer({this.controller});

  @override
  _PasswordFieldContainerState createState() => _PasswordFieldContainerState();
}

class _PasswordFieldContainerState extends State<PasswordFieldContainer> {
  bool _obscureText = true;

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: TextField(
        controller: widget.controller,
        style: kFieldTextStyle,
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 40.0,
            color: kPrimaryColor,
          ),
          hintText: 'Enter your password',
          hintStyle: TextStyle(
            fontSize: 20.0,
          ),
          suffixIcon: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              Icons.visibility,
            ),
          ),
        ),
      ),
    );
  }
}
