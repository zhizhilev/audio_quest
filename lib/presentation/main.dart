import 'package:flutter/material.dart';


class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Аудиоквест'),
      // ),
      body: Center(
        child: Column(
          children: [
            //Placeholder(),
            Image.asset("assets/images/main_background.jpeg", fit:BoxFit.fitWidth),
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

