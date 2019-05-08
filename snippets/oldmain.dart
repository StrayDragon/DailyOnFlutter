import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../snippets/widget_timer.dart';

void main(List<String> args) => runApp(AppSkeleton());

class AppSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHomePage(),
      theme: ThemeData.light(),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage> {
  FlutterLocalNotificationsPlugin notificationsPlugin;

  @override
  void initState() {
    super.initState();
    notificationsPlugin = FlutterLocalNotificationsPlugin();
    notificationsPlugin.initialize(
      InitializationSettings(
        AndroidInitializationSettings("@mipmap/ic_launcher"),
        IOSInitializationSettings(),
      ),
      onSelectNotification: (String payload) async => await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("balabala"),
                  content: Text("labalaba"),
                ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: CountDownWidget(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('title'),
              onTap: () => print("tapped!"),
            ),
            RaisedButton(
              onPressed: () async => await notificationsPlugin.show(
                    0,
                    'balabala,,',
                    'body',
                    NotificationDetails(
                      AndroidNotificationDetails(
                        'channel id',
                        'channel name',
                        'channel description',
                      ),
                      IOSNotificationDetails(),
                    ),
                    payload: 'payload',
                  ),
              child: Text("Touch me"),
            )
          ],
        ),
      ),
    );
  }
}
