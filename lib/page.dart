import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PreferredSize getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(40.0),
      child: GestureDetector(
        onPanStart: (details) async {
          await windowManager.startDragging();
        },
        child: AppBar(
          backgroundColor: Color(0xFF5C6BC0),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                'assets/hmcl.png',
                height: 24,
                width: 24,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 8),
              Text(
                "Hello Minecraft! Launcher 4.0.@flutter@",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () async {
                await windowManager.minimize();
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await windowManager.close();
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Center(child: Text('主页')),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppBar(), body: getBody(context));
  }
}