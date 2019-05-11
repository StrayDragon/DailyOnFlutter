import 'package:daily/app/view/components/stacking_cards_view.dart';
import 'package:daily/testing_my_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  static const String ROUTE_NAME = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily',
      theme: ThemeData.dark(),
      initialRoute: TestingWidgetHomePage.ROUTE_NAME,
      routes: {
        TestingWidgetHomePage.ROUTE_NAME: (BuildContext context) =>
            TestingWidgetHomePage(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily"),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: 30,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              StackingCardsView().toStringShort() + ":",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        StackingCardsView(),
        SizedBox(
          height: 30,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              TestingWidgetHomePage().toStringShort() + ":",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        RaisedButton(
          child: Text("测试我的Widget"),
          onPressed: () {
            Navigator.of(context).pushNamed(TestingWidgetHomePage.ROUTE_NAME);
          },
        )
      ]),
    );
  }
}
