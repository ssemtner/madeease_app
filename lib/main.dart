import 'package:flutter/material.dart';
import 'package:madeease_app/tutorials.dart';
import 'welcome.dart';
import 'login.dart';
import 'authentication.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class TutorialData {
  String img;
  String text;

  tutorialData(Map<String, String> data) {
    img = data['img'];
    text = data['text'];
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<BaseAuth>(
      create: (_) => Auth(),
      child: MaterialApp(
        title: 'MadeEase',
        initialRoute: '/',
        routes: {
          '/': (context) => Root(),
          '/welcome': (context) => WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/tutorial/welcome': (context) => TutorialScreen(),
          '/test': (context) => TutorialScreen(
            image: 'hi',
            numPages: 10,
            currentPage: 3,
            tutorialName: "Purchasing an item from Amazon",
            data: [
              ['assets/images/test.jpg', 'test'],
              ['assets/images/test.jpg', 'hello to you'],
              ['assets/images/hello.png', 'This is a sentence that is a bit longer for testing purposes.']
            ],
              ),
        },
        theme: ThemeData(
          fontFamily: 'Montserrat',
          backgroundColor: Colors.white,
          primaryColor: Color(0xFF078BFF),
          accentColor: Color(0xFFFF5666),
          cardColor: Color(0xFFF29559),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = '';

  @override
  void initState() {
    super.initState();
    context.read<BaseAuth>().getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback() {
    context.read<BaseAuth>().getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
        print(_userId);
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void signUpCallback() {
    context.read<BaseAuth>().getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
        print(_userId);
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
      //something different for first time sign up can go here, like a tutorial.
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = '';
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(body: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return LoginScreen(
          loginCallback: loginCallback,
          signUpCallback: signUpCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return WelcomeScreen();
        } else {
          return buildWaitingScreen();
        }
        break;
      default:
        return buildWaitingScreen();
    }
  }
}
