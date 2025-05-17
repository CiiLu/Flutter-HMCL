import 'package:flutter/material.dart';
import 'minecraft_install_page.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<StatefulWidget> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  int? _currentPageId;

  void _navigate(int id) {
    setState(() {
      _currentPageId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPageId == null) {
      return Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: getCard(0, Theme.of(context), context, () => _navigate(0)),
          ),
          Positioned(
            top: 20,
            left: 20 + 160,
            child: getCard(1, Theme.of(context), context, () => _navigate(1)),
          ),
          Positioned(
            top: 190,
            left: 20 ,
            child: getCard(2, Theme.of(context), context, () => _navigate(2)),
          ),
          Positioned(
            top: 190,
            left: 20 + 160,
            child: getCard(3, Theme.of(context), context, () => _navigate(3)),
          ),
          Positioned(
            top: 190,
            left: 20 + 160 * 2,
            child: getCard(4, Theme.of(context), context, () => _navigate(4)),
          ),
          Positioned(
            top: 190,
            left: 20 + 160 * 3,
            child: getCard(5, Theme.of(context), context, () => _navigate(5)),
          ),
        ],
      );
    } else {
      return getChild(_currentPageId);
    }
  }

  Widget getCard(
    int id,
    ThemeData theme,
    BuildContext context,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        color: theme.cardColor.withValues(alpha: 0.8),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: onTap,
          child: Stack(
            children: [
              Positioned(
                top: 5,
                right: 5,
                child: Text(
                  getType(id),
                  style: TextStyle(fontSize: 15, color: Colors.indigo),
                ),
              ),
              Positioned(
                top: 20,
                right: 5,
                child: Text(
                  getName(id),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(bottom: 0, left: 0, child: getIcon(id)),
            ],
          ),
        ),
      ),
    );
  }

  String getName(int id) {
    switch (id) {
      case 0:
        return "本体";
      case 1:
        return "整合包";
      case 2:
        return "模组";
      case 3:
        return "资源包";
      case 4:
        return "世界";
      case 5:
        return "光影";
      default:
        return "?";
    }
  }

  Widget getIcon(int id) {
    String file = "assets/hmcl.png";
    switch (id) {
      case 0:
        file = "assets/blocks/grass.png";
      case 1:
        file = "assets/blocks/crafting_table.png";
      case 2:
        file = "assets/blocks/command.gif";
      case 3:
        file = "assets/blocks/furnace.png";
      case 4:
        file = "assets/blocks/carto.png";
      case 5:
        file = "assets/blocks/beacon.png";
    }
    return Image.asset(file, height: 100, width: 100, fit: BoxFit.contain);
  }

  Widget getChild(int? currentPageId) {
    switch (currentPageId) {
      case 0:
        return MinecraftInstallPage();
      case 1:
        return Text("整合包");
      case 2:
        return Text("模组");
      case 3:
        return Text("资源包");
      case 4:
        return Text("世界");
      case 5:
        return Text("光影");
      default:
        return Text("?");
    }
  }

  String getType(int id) {
    if (id < 2) {
      return "游戏";
    } else {
      return "资源";
    }
  }
}

