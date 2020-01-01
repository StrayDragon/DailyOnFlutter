import 'package:flutter/material.dart';

import 'app/view/challenge/components.dart';
import 'ui_main/routes.dart';

void main() {
  routes.addAll(
    {
      '/test-ui': (context) => Scaffold(
            appBar: AppBar(
              title: Text("ChallengeCard"),
            ),
            body: Container(
              child: ChallengeCard(),
            ),
          ),
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StaggeredGridView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/test-ui',
    );
  }
}
