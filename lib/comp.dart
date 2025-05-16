import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class NavDrawer extends StatefulWidget {
  final int id;
  final ValueChanged<int> onItemTapped;

  const NavDrawer({super.key, required this.id, required this.onItemTapped});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool isCollapsed = false;

  void toggleCollapse() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color? getColor(int index) =>
        widget.id == index
            ? theme.textSelectionTheme.selectionColor
            : Colors.white;

    IconData getIconData(int index) {
      switch (index) {
        case 0:
          return Icons.home;
        case 1:
          return Icons.list;
        case 2:
          return Icons.download;
        case 3:
          return Icons.settings;
        default:
          return Icons.error;
      }
    }

    String getItemLabel(int index) {
      switch (index) {
        case 0:
          return "主页";
        case 1:
          return "列表";
        case 2:
          return "下载";
        case 3:
          return "设置";
        default:
          return "";
      }
    }

    return SizedBox(
      width: isCollapsed ? 60 : 150,
      child: Column(
        children: [
          Expanded(
            child:
                isCollapsed
                    ? NavigationRail(
                      backgroundColor: theme.primaryColor,
                      indicatorColor: theme.indicatorColor,
                      selectedIndex: widget.id,
                      onDestinationSelected: widget.onItemTapped,
                      destinations: List<NavigationRailDestination>.generate(
                        4,
                        (index) {
                          final IconData iconData = getIconData(index);
                          return NavigationRailDestination(
                            icon: Icon(iconData, color: getColor(index)),
                            label: Text(
                              getItemLabel(index),
                              style: TextStyle(
                                color: getColor(index),
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                        color: theme.primaryColor,
                      ),
                      child: NavigationDrawer(
                        backgroundColor: Colors.transparent,
                        indicatorColor: theme.indicatorColor,
                        shadowColor: theme.drawerTheme.shadowColor,
                        selectedIndex: widget.id,
                        onDestinationSelected: widget.onItemTapped,
                        children: List<NavigationDrawerDestination>.generate(
                          4,
                          (index) {
                            final IconData iconData = getIconData(index);
                            return NavigationDrawerDestination(
                              icon: Icon(iconData, color: getColor(index)),
                              label: Text(
                                getItemLabel(index),
                                style: TextStyle(
                                  color: getColor(index),
                                  fontSize: 14,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
          ),
          Container(
            color: theme.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 48,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isCollapsed ? Icons.menu_open : Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: toggleCollapse,
                  tooltip: isCollapsed ? '展开' : '折叠',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

PreferredSize getAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(40.0),
    child: GestureDetector(
      onPanStart: (details) async {
        await windowManager.startDragging();
      },
      child: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () async {
              await launchUrl(Uri.https('docs.hmcl.net', '/groups.html'));
            },
            color: Colors.white,
          ),
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
