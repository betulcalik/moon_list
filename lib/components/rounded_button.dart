import 'package:flutter/material.dart';
import 'constraints.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String text;

  RoundedButton(
      {@required this.color, @required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 0, 0, 45.0),
      width: 250.0,
      height: 55.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: kNormalBoldTextStyle,
        ),
      ),
    );
  }
}
