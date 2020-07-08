import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madeease_app/button.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Wave'),
              SvgPicture.asset(
                '/assets/logo/m.svg',
                width: 200,
              )
            ],
          ),
          Text(
            'This is where the text goes.',
            style: TextStyle(),
          ),
          MERaisedButton(
            action: () => print('thing'),
            text: 'Take a Tour',
            width: MediaQuery.of(context).size.width - 200,
          )
        ],
      ),
    );
  }
}
