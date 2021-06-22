import 'package:audio_quest/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:audio_quest/domain/state/home/home_state.dart';
import 'package:audio_quest/internal/dependencies/home_module.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    super.initState();
    print("init login");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аудиоквест'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                child: Text("Залогинься быстро. Ска"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Home()
                  ));
                }),


          ],
        ),
      ),
    );
  }




}


