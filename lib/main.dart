import 'package:flutter/material.dart';

void main(List<String> args) => runApp(AppSkeleton());

class AppSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('title'),
              onTap: () => print("tapped!"),
            ),
          ],
        ),
      ),
    );
  }
}
