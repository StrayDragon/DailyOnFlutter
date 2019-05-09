import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

class NotificationsPluginProvider {
  static NotificationsPluginProvider init({
    @required String iconNameOfAndroid,
    @required callback,
  }) {
    return _singleton;
  }

  static final NotificationsPluginProvider _singleton =
      NotificationsPluginProvider._internal();

  FlutterLocalNotificationsPlugin notificationsPlugin;

  NotificationsPluginProvider._internal() {
    notificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings("@mipmap/ic_launcher");
    var ios = IOSInitializationSettings();
    var initSetting = InitializationSettings(android, ios);
    notificationsPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {}
}
