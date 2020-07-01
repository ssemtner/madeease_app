import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/logos/m.svg',
              height: 200,
              placeholderBuilder: (BuildContext context) => Container(
                  padding: EdgeInsets.all(30.0),
                  child: CircularProgressIndicator()),
            ),
            SvgPicture.asset(
              'assets/wave1.svg',
              placeholderBuilder: (BuildContext context) => Container(
                  height: 100,
                  padding: EdgeInsets.all(30.0),
                  child: CircularProgressIndicator()),
            ),
            RaisedButton(
              onPressed: () => {},
              color: Theme.of(context).primaryColor,
              child: Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
