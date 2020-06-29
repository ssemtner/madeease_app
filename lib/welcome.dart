import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/me.svg',
            semanticsLabel: "MadeEase Logo",
            width: 100,
            height: 100,
          ),
          Text("Wavy icon"),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text("Get f"),
          )
        ],
      ),
    );
  }
}