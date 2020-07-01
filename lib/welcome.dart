import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madeease_app/waves.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SizedBox(
    //     width: MediaQuery.of(context).size.width,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         SvgPicture.asset(
    //           'assets/logos/m.svg',
    //           height: 200,
    //           placeholderBuilder: (BuildContext context) => Container(
    //               padding: EdgeInsets.all(30.0),
    //               child: CircularProgressIndicator()),
    //         ),
    //         Wave(),
    //         RaisedButton(
    //           onPressed: () => {},
    //           color: Theme.of(context).primaryColor,
    //           child: Text("Get Started"),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return SizedBox(width: 500, height: 500, child: Wave());
  }
}
