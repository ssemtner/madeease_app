import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madeease_app/button.dart';

class WelcomeScreen extends StatelessWidget {
  SizedBox customSpacer(context, percentHeight) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * (percentHeight / 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            customSpacer(context, 10),
            SvgPicture.asset(
              'assets/logos/m.svg',
              width: MediaQuery.of(context).size.width / 2.5,
              placeholderBuilder: (context) => CircularProgressIndicator(),
            ),
            Text(
              'Made Ease',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 36.0),
            ),
            customSpacer(context, 0),
            SvgPicture.asset(
              'assets/waves/front.svg',
              width: MediaQuery.of(context).size.width,
              placeholderBuilder: (context) => CircularProgressIndicator(),
            ),
            MERaisedButton(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              action: () => print("button"),
              text: 'Get Started',
            ),
            customSpacer(context, 10)
          ],
        ),
      ),
    );
    // return Scaffold(body: SizedBox(child: Wave(), height: 200));
  }
}
