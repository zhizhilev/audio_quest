import 'package:audio_quest/presentation/main.dart';
import 'package:flutter/material.dart';
import 'package:audio_quest/presentation/home.dart';
import 'package:audio_quest/presentation/login.dart';




class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBody();
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Login()
      initialRoute: '/',
      routes: {
        '/': (context) => Main(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }




}


