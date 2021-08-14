import 'package:flutter/material.dart';

class QuestList extends StatefulWidget {
  @override
  _QuestListState createState() => _QuestListState();
}

class _QuestListState extends State<QuestList> {

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Тут у нас список значит',
      style: optionStyle,
    ),
    Text(
      'Тут мы что-то показываем',
      style: optionStyle,
    ),
    Text(
      'Тут вообще крутотень',
      style: optionStyle,
    ),
    Text(
      'Тут настройки профиля',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Квесты'),
        backgroundColor: Color(0xff4A6FA5),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Квесты',
            backgroundColor: Color(0xff4A6FA5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Купить',
            backgroundColor: Color(0xff4A6FA5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.white,),
            label: 'Продать',
            backgroundColor: Color(0xff4A6FA5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Профиль',
              backgroundColor: Colors.amberAccent
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffE5E5E5),
        unselectedItemColor: Colors.white,
        // fixedColor: Colors.white,
        onTap: _onItemTapped,
        showSelectedLabels:true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff4A6FA5),
      ),
    );
  }

}



