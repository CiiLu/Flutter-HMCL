import 'package:flutter/material.dart';

import 'core/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned(top: 20, left: 20, child: getCard(theme)),
        Positioned(bottom: 20, right: 20, child: getLaunchButton(theme)),
      ],
    );
  }
}

Widget getLaunchButton(ThemeData t) {
  final theme = t.floatingActionButtonTheme;
  return FloatingActionButton.extended(
    foregroundColor: Colors.white,
    label: Column(
      children: [
        Text("启动游戏", style: TextStyle(fontSize: 16)),
        Text(
          Profile.getCurrentProfile().name,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    ),
    icon: Icon(Icons.play_arrow, size: 30),
    backgroundColor: t.primaryColor,
    onPressed: () => {},
  );
}

Widget getCard(ThemeData t) {
  return Card(
    color: t.cardColor,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Container(
      width: 400,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '提示',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: t.primaryColor,
            ),
          ),
          SizedBox(height: 8),

          Text(
            """你正在使用 HMCL 开发版。开发版包含一些未在稳定版中包含的测试性功能，仅用于体验新功能。开发版功能未受充分验证，使用起来可能不稳定！
如果你使用时遇到了问题，可以通过设置中反馈页面提供的渠道进行反馈。欢迎关注 B 站账号 @huanghongxun 以关注 HMCL 的重要动态，或关注 @Glavo 以了解 HMCL 的开发进展。""",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.2, // 行高
            ),
          ),
        ],
      ),
    ),
  );
}
