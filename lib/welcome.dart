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
            'assets/images/me.svg',
            height: 100,
            width: 100,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()),
          ),
          Text("Wavy icon"),
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
