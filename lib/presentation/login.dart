import 'package:flutter/material.dart';

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
                  Navigator.pushNamed(context, '/home');
                }),


          ],
        ),
      ),
    );
  }




}


