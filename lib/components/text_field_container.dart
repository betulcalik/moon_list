import 'package:flutter/material.dart';
import 'constraints.dart';

class TextFieldContainer extends StatelessWidget {
  final IconData iconData;
  final String text;
  final TextEditingController controller;

  TextFieldContainer(
      {@required this.iconData, @required this.text, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: TextField(
        controller: controller,
        style: kFieldTextStyle,
        decoration: InputDecoration(
          icon: Icon(
            iconData,
            size: 40.0,
            color: kPrimaryColor,
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
