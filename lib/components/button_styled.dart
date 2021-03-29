import 'package:flutter/material.dart';

class ButtonStyled extends StatelessWidget {
  ButtonStyled({this.colour, this.buttonTitle, this.onPressed});

  final Color colour;
  final String buttonTitle;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 50.0,
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
