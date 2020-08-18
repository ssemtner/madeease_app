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
          ),
        ],
      ),
    );
  }
}

class TutorialPage extends StatelessWidget {
  TutorialPage(
      {this.image, this.currentPage, this.numPages, this.tutorialName});
  final image;
  final int currentPage, numPages;
  final String tutorialName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            '/assets/waves/white.svg',
            width: MediaQuery.of(context).size.height,
            placeholderBuilder: (context) => CircularProgressIndicator(),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                tutorialName,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          Text(
            tutorialName,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          Row(
            children: <Widget>[Container()],
          ),
          Spacer(),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                currentPage.toString() + '  /  ' + numPages.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
