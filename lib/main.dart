import 'package:daily/app/view/components/stacking_cards_view.dart';
import 'package:daily/device_service/device_service.dart';
import 'package:daily/testing_my_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String ROUTE_NAME = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			title: 'Daily(测试版)',
			theme: ThemeData.light(),
			initialRoute: MyApp.ROUTE_NAME,
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
			resizeToAvoidBottomPadding: false,
			appBar: AppBar(
				title: Text("Daily"),
				centerTitle: true,
			),
			body: ListView(
				children: <Widget>[
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
					),
					SizedBox(
						height: 30,
						child: Align(
							alignment: Alignment.topLeft,
							child: Text(
								TestingLocalNotificationHomePage().toStringShort() + ":",
								style: TextStyle(fontSize: 20),
							),
						),
					),
					TestingLocalNotificationHomePage(),
				],
			),
			floatingActionButton: FloatingActionButton(
				tooltip: '添加新的任务',
				onPressed: () async {
					await showDialog(
						context: context,
						builder: (context) =>
								SimpleDialog(
									title: Text('添加新的任务'),
									shape: RoundedRectangleBorder(
										borderRadius: BorderRadius.circular(20.0),
									),
									contentPadding: EdgeInsets.all(12.0),
									//边缘距离
									elevation: 0.5,
									children: <Widget>[
										Form(
											child: Column(
												children: <Widget>[
													TextFormField(
														decoration: InputDecoration(
															labelText: 'Your Name',
														),
														onSaved: (val) {
															_name = val;
														},
													),
													TextFormField(
														decoration: InputDecoration(
															labelText: 'Password',
														),
														obscureText: true,
														validator: (val) {
															return val.length < 4 ? "密码长度错误" : null;
														},
														onSaved: (val) {
															_password = val;
														},
													),
												],
											),
										),
										RaisedButton(
											onPressed: () {},
											child: Text("确定"),
										)
									],
								),
					);
					debugPrint("摁下FloatingActionButton");
				},
				child: Icon(Icons.add),
			),
		);
	}

	String _name = '';
	String _password = '';
}

class TestingLocalNotificationHomePage extends StatefulWidget {
	@override
	_TestingLocalNotificationHomePageState createState() =>
			_TestingLocalNotificationHomePageState();
}

class _TestingLocalNotificationHomePageState
		extends State<TestingLocalNotificationHomePage> {
	@override
	Widget build(BuildContext context) {
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.center,
			children: <Widget>[
				RaisedButton(
						child: Text("SilentNotification"),
						onPressed: () async =>
								(await DeviceService.notification)
										.showSilentNotification(title: "测试", body: "啊啊啊啊啊啊")),
				RaisedButton(
						child: Text("OnGoingNotification"),
						onPressed: () async =>
								(await DeviceService.notification)
										.showOngoingNotification(title: "测试", body: "啊啊啊啊啊啊")),
			],
    );
  }
}
