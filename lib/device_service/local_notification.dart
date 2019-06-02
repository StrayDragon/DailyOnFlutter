import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

/// **IMPORTANT**: Must call this functor in the `main()` before run your app
///
/// Initialize the FlutterLocalNotificationsPlugin singleton.
class InitializeDefaultLocalNotificationsPlugin {
  InitializeDefaultLocalNotificationsPlugin.call({
    SelectNotificationCallback onSelect,
  }) {
    _flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        AndroidInitializationSettings("@mipmap/ic_launcher"),
        IOSInitializationSettings(),
      ),
      onSelectNotification: onSelect,
    );
  }
}

void initializeDefaultLocalNotificationsPlugin({
  SelectNotificationCallback onSelect,
}) {
  _flutterLocalNotificationsPlugin.initialize(
    InitializationSettings(
      AndroidInitializationSettings("@mipmap/ic_launcher"),
      IOSInitializationSettings(),
    ),
    onSelectNotification: onSelect,
  );
}

Future<void> pushCountdownNotification(Duration duration) {}
Future<void> pushScheduledNotification(DateTime dateTime) {}
Future<void> pushWeeklyNotification() {}
Future<void> pushDailyNotification() {}
Future<void> pushSimpleNotification() {}
