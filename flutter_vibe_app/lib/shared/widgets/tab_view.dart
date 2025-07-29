import 'package:flutter/cupertino.dart';

class TabView extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> pages;

  const TabView({
    super.key,
    required this.tabs,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabs
            .map((e) => BottomNavigationBarItem(icon: e))
            .toList(growable: false),
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return pages[index];
          },
        );
      },
    );
  }
}
