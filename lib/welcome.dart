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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              customSpacer(context, 10),
              Hero(
                tag: 'mLogo',
                child: SvgPicture.asset(
                  'assets/logos/m.svg',
                  width: MediaQuery.of(context).size.width / 2.5,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                ),
              ),
              Text(
                'Made Ease',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 36.0),
              ),
              customSpacer(context, 0),
              Hero(
                tag: 'wave',
                child: SvgPicture.asset(
                  'assets/waves/white.svg',
                  width: MediaQuery.of(context).size.width,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                ),
              ),
              customSpacer(context, 30),
              MERaisedButton(
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                action: () => Navigator.pushNamed(context, '/login'),
                text: 'Get Started',
              ),
              customSpacer(context, 10)
            ],
          ),
        ),
      ),
    );
  }
}
