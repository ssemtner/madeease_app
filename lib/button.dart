import 'package:flutter/material.dart';

class MESecondaryButton extends StatelessWidget {
  MESecondaryButton({this.text, this.action, this.width, this.height});

  final String text;
  final Function action;
  final double width, height;

  void preformAction() {
    action();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RawMaterialButton(
        onPressed: preformAction,
        fillColor: Colors.white70,
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MERaisedButton extends StatelessWidget {
  MERaisedButton({this.text, this.action, this.width, this.height});

  final String text;
  final Function action;
  final double width, height;

  void preformAction() {
    action();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RawMaterialButton(
        onPressed: preformAction,
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
