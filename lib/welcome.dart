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
            color: Colors.red,
          ),
          Text("Wavy Icon"),
          RaisedButton(
            onPressed: () => {},
            color: Theme.of(context).primaryColor,
            child: Text("Get f"),
          )
        ],
      ),
    );
  }
}