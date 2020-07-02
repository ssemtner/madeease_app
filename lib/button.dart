import 'package:flutter/material.dart';

class MERaisedButton extends StatelessWidget {
  MERaisedButton({this.text, this.action, this.width, this.height});

  final String text;
  final Function action;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RawMaterialButton(
        onPressed: action,
        fillColor: Theme.of(context).primaryColor,
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
