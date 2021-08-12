import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  void initState() {
    super.initState();
    print("init Main");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Аудиоквест'),
      // ),
      body: Center(
        child: Column(
          children: [
            Placeholder(),
            ElevatedButton(
                child: Text("Войти"),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                }),
            ElevatedButton(
                child: Text("Зарегистрироваться"),
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                }),


          ],
        ),
      ),
    );
  }




}


