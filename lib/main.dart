import 'package:flutter/material.dart';
import 'package:madeease_app/tutorials.dart';
import 'welcome.dart';
import 'login.dart';
import 'authentication.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
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
          '/': (context) => RootPage(),
          '/welcome': (context) => WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/tutorial/welcome': (context) => TutorialScreen(),
          '/test': (context) => TutorialPage(
                image: 'hi',
                numPages: 10,
                currentPage: 3,
                tutorialName: "Purchasing an item from Amazon",
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

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
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
      //something differant for first time sign up can go here, like a tutorial.
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
