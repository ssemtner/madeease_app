import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen(
      {this.image, this.currentPage, this.numPages, this.tutorialName, this.data});

  final image;
  final data;
  final int currentPage, numPages;
  final String tutorialName;

  @override
  State<StatefulWidget> createState() => TutorialScreenState();
}

class TutorialScreenState extends State<TutorialScreen> {
  int currentPage = 1;

  void increasePage() {
    if (currentPage < widget.numPages) {
      setState(() {
        currentPage++;
      });
    }
  }

  void decreasePage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 65,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Center(
              child: Text(
                widget.tutorialName,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: TutorialPage(num: currentPage, data: widget.data),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                IconButton(
                  onPressed: decreasePage,
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                Spacer(),
                Text(
                  currentPage.toString() + '  /  ' + widget.numPages.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                Spacer(),
                IconButton(
                  onPressed: increasePage,
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TutorialPage extends StatelessWidget {
  TutorialPage({this.num, this.data});

  final num;
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Spacer(),
          Image(
            image: AssetImage(data[num - 1][0]),
            height: MediaQuery.of(context).size.height / 2,
          ),
          Spacer(),
          Text(
              data[num - 1][1],
            style: TextStyle(fontSize: 24.0),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
