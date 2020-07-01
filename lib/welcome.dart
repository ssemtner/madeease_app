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
            Spacer(flex: 2),
            Flexible(
              flex: 10,
              child: SvgPicture.asset(
                'assets/logos/m.svg',
                placeholderBuilder: (context) => CircularProgressIndicator(),
              ),
            ),
            Spacer(),
            Text(
              'Made Ease',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0),
            ),
            Spacer(),
            SvgPicture.asset(
              'assets/logos/thing.svg',
              width: MediaQuery.of(context).size.width,
              placeholderBuilder: (context) => CircularProgressIndicator(),
            ),
            Flexible(
              flex: 2,
              child: RaisedButton(
                onPressed: () => {},
                color: Theme.of(context).primaryColor,
                child: Text("Get Started!"),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
    // return Scaffold(body: SizedBox(child: Wave(), height: 200));
  }
}
