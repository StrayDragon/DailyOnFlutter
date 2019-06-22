import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/hidden_drawer/screen_hidden_drawer.dart';
import 'package:hidden_drawer_menu/menu/item_hidden_menu.dart';

import 'challenge/pages.dart';

final List<ScreenHiddenDrawer> _pages = [
  ScreenHiddenDrawer(
    ItemHiddenMenu(
      name: "挑战",
      colorLineSelected: Colors.blueAccent,
      baseStyle:
          TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
      selectedStyle: TextStyle(color: Colors.blue),
    ),
    Container(
      color: Colors.teal,
      child: DailyChallengesPage(),
    ),
  ),
];

class DailyMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: _pages,
      backgroundColorMenu: Colors.cyan[100],
      slidePercent: 70.0,
      contentCornerRadius: 40.0,
      backgroundColorAppBar: Colors.blueAccent,
    );
  }
}
