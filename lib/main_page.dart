import 'package:flutter/material.dart';
import 'package:flutter_hmcl/pages.dart';

import './comp.dart';

class _HomePage extends StatefulWidget {
  const _HomePage({
    super.key,
  });

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
      appBar: getAppBar(context),
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
      return Home();
    case 1:
      return Text("2");
  }
  return Text("NotFound");
}
