import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

class LocalNotificationPlugin {
  static Future<LocalNotificationPlugin> defaultInitialize() async {
    final settingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {});
    var plugin = LocalNotificationPlugin();
    await plugin._notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: (_) {});
    return plugin;
  }

  var _notifications = FlutterLocalNotificationsPlugin();

  Future showNotification({
    @required String title,
    @required String body,
    @required NotificationDetails notificationType,
    int id = 0,
  }) =>
      _notifications.show(id, title, body, notificationType);

  /// - call this by:
  /// ```
  ///   (await DeviceService.notification).showSilentNotification(
  ///     title: 'balabala',
  ///     body: '23333',
  ///   );
  /// ```
  /// - or:
  /// ```
  ///   DeviceService.notification.then((plugin) => plugin.showSilentNotification(
  ///         title: 'balabala',
  ///         body: '23333',
  ///       ));
  /// ```
  Future showSilentNotification({
    @required String title,
    @required String body,
    int id = 0,
  }) =>
      showNotification(
        title: title,
        body: body,
        id: id,
        notificationType: NotificationTypes.noSound,
      );

  Future showOngoingNotification({
    @required String title,
    @required String body,
    int id = 0,
  }) =>
      showNotification(
        title: title,
        body: body,
        id: id,
        notificationType: NotificationTypes.onGoing,
      );

  Future cancelAll() => _notifications.cancelAll();
}

class NotificationTypes {
  static NotificationDetails get onGoing {
    final androidChannelSpecifics = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: true,
      autoCancel: false,
    );
    final iOSChannelSpecifics = IOSNotificationDetails();
    return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
  }

  static NotificationDetails get noSound {
    final androidChannelSpecifics = AndroidNotificationDetails(
      'silent channel id',
      'silent channel name',
      'silent channel description',
      playSound: false,
    );
    final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);

    return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
  }
}
