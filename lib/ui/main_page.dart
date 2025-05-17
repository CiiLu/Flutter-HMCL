import 'package:flutter/material.dart';
import 'package:flutter_hmcl/ui/home_page.dart';

import 'comp.dart';
import 'download_page.dart';

class _HomePage extends StatefulWidget {
  const _HomePage();

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
    case 2:
      return DownloadPage();
  }
  return Text("NotFound");
}
