import 'plugin/local_notification.dart' show LocalNotificationPlugin;

class DeviceService {
  DeviceService._();

  // ignore: unused_field
  static final DeviceService _singleton = DeviceService._();

  static Future<LocalNotificationPlugin> get notification =>
      LocalNotificationPlugin.defaultInitialize();

// NOTE: Other device service template:
// static OtherServicePlugin get otherService => OtherServicePlugin.factoryMethodOrNot();
}
