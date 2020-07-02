import 'package:flutter/material.dart';
import 'welcome.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MadeEase',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Montserrat',
        backgroundColor: Colors.white,
        primaryColor: Color(0xFF078BFF),
        accentColor: Color(0xFFFF5666),
        cardColor: Color(0xFFF29559),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
