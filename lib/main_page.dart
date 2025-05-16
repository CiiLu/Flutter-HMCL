import 'package:flutter/material.dart';

import './comp.dart';

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "Hello Minecraft! Launcher 4.0.@flutter@"),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            NavDrawer(id: _selectedIndex, onItemTapped: _onItemTapped),
            Expanded(child: getPage(_selectedIndex)),
          ],
        ),
      ),
    );
  }
}

Widget getHomePage() {
  return _HomePage();
}

Widget getPage(int id) {
  switch (id) {
    case 0:
      return Text("1");
    case 1:
      return Text("2");
  }
  return Text("NotFound");
}
