import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Logo with text"),
          Text("Wavy icon"),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text("Get Started"),
          )
        ],
      ),
    );
  }
}