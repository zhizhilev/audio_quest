import 'package:flutter/material.dart';
import 'package:audio_quest/presentation/home.dart';





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
      home: Home()
    );
  }




}


