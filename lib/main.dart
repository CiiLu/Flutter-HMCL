import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.ensureInitialized();
  windowManager.setSize(Size(800, 500));
  windowManager.setTitleBarStyle(TitleBarStyle.hidden);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Minecraft! Launcher Flutter',
      theme: ThemeData(
        navigationDrawerTheme: NavigationDrawerThemeData(

          tileHeight: 40,
        ),
        fontFamily: "MiSans",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF5C6BC0)),
      ),
      home: getHomePage(),
    );
  }
}
