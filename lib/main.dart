import 'package:flutter/material.dart';

import 'app/view/pages.dart' show DailyChallengesPage;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String ROUTE_NAME = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily(测试版)',
      theme: ThemeData.light(),
      home: DailyChallengesPage(),
    );
  }
}
