import 'package:flutter/material.dart';

void main() => runApp(UiApp());

class UiApp extends StatelessWidget {
  static const String ROUTE_NAME = '/testing-my-widget';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(ROUTE_NAME.substring(1)),
          centerTitle: true,
        ),
        body: PageViewPage(),
      ),
    );
  }
}

class PageViewPage extends StatelessWidget {
  final List<String> _pageName = <String>["第一页", '第二页', '第三页'];

  List<Widget> _makePages() {
    return List.generate(
      _pageName.length,
      (index) => Container(
            color: Colors.blue[300],
            alignment: Alignment(0.0, 0.0),
            child: GestureDetector(
              onTap: () {
                debugPrint("按了  ${_pageName[index]}");
              },
              child: Text(
                "${_pageName[index]}",
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: _makePages(),
    );
  }
}
