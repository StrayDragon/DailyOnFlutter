import 'package:flutter/services.dart';
import 'package:platform/platform.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mockito/mockito.dart';

import 'assets/local_notification_test_asset.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  MockMethodChannel mockChannel;
  FlutterLocalNotificationsPlugin plugin;

  group("Local notification by using the packages:flutter_local_notification",
      () {
    group("android", () {
      setUp(() {
        mockChannel = MockMethodChannel();
        plugin = FlutterLocalNotificationsPlugin.private(
          mockChannel,
          FakePlatform(operatingSystem: 'android'),
        );
      });

      test('initialize the plugin', () async {
        const AndroidInitializationSettings initializationSettingsAndroid =
            AndroidInitializationSettings('@mipmap/ic_launcher');

        const InitializationSettings initializationSettings =
            InitializationSettings(initializationSettingsAndroid, null);

        await plugin.initialize(
          initializationSettings,
        );

        verify(mockChannel.invokeMethod(
            'initialize', initializationSettingsAndroid.toMap()));
      });

      test('show the notification', () async {
        var androidSpecifics = AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription,
          importance: Importance.Max,
          priority: Priority.High,
        );

        var platformSpecifics = NotificationDetails(androidSpecifics, null);

        await plugin.show(
          0,
          title,
          body,
          platformSpecifics,
          payload: payload,
        );

        verify(mockChannel.invokeMethod('show', <String, dynamic>{
          'id': id,
          'title': title,
          'body': body,
          'platformSpecifics': androidSpecifics.toMap(),
          'payload': payload
        }));
      });

      test('schedule the notification', () async {
        var scheduledDuration = DateTime.now().add(Duration(seconds: 5));

        var androidSpecifics = AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription,
        );

        var platformSpecifics = NotificationDetails(androidSpecifics, null);

        await plugin.schedule(
          id,
          title,
          body,
          scheduledDuration,
          platformSpecifics,
        );

        verify(mockChannel.invokeMethod('schedule', <String, dynamic>{
          'id': id,
          'title': title,
          'body': body,
          'millisecondsSinceEpoch': scheduledDuration.millisecondsSinceEpoch,
          'platformSpecifics': androidSpecifics.toMap(),
          'payload': ''
        }));
      });

      test('repeal the notification', () async {
        await plugin.cancel(id);
        verify(mockChannel.invokeMethod('cancel', id));
      });
    }); //group "android"

    group("ios", () {
      group('ios', () {
        setUp(() {
          mockChannel = MockMethodChannel();
          plugin = FlutterLocalNotificationsPlugin.private(
              mockChannel, FakePlatform(operatingSystem: 'ios'));
        });

        test('initialise plugin', () async {
          const IOSInitializationSettings initializationSettingsIOS =
              IOSInitializationSettings();
          const InitializationSettings initializationSettings =
              InitializationSettings(null, initializationSettingsIOS);

          await plugin.initialize(initializationSettings);

          verify(
            mockChannel.invokeMethod(
                'initialize', initializationSettingsIOS.toMap()),
          );
        });

        test('show notification', () async {
          IOSNotificationDetails iOSPlatformChannelSpecifics =
              IOSNotificationDetails();
          NotificationDetails platformChannelSpecifics =
              NotificationDetails(null, iOSPlatformChannelSpecifics);

          await plugin.show(
            0,
            title,
            body,
            platformChannelSpecifics,
            payload: payload,
          );

          verify(
            mockChannel.invokeMethod(
              'show',
              <String, dynamic>{
                'id': id,
                'title': title,
                'body': body,
                'platformSpecifics': iOSPlatformChannelSpecifics.toMap(),
                'payload': payload
              },
            ),
          );
        });

        test('schedule notification', () async {
          var scheduledNotificationDateTime =
              DateTime.now().add(Duration(seconds: 5));
          IOSNotificationDetails iOSPlatformChannelSpecifics =
              IOSNotificationDetails();
          NotificationDetails platformChannelSpecifics =
              NotificationDetails(null, iOSPlatformChannelSpecifics);

          await plugin.schedule(
            id,
            title,
            body,
            scheduledNotificationDateTime,
            platformChannelSpecifics,
          );

          verify(mockChannel.invokeMethod('schedule', <String, dynamic>{
            'id': id,
            'title': title,
            'body': body,
            'millisecondsSinceEpoch':
                scheduledNotificationDateTime.millisecondsSinceEpoch,
            'platformSpecifics': iOSPlatformChannelSpecifics.toMap(),
            'payload': ''
          }));
        });

        test('repeal notification', () async {
          await plugin.cancel(id);
          verify(mockChannel.invokeMethod('cancel', id));
        });
      }); //group "ios"
    }); //group "Local notification by using the packages:flutter_local_notification"
  });
}
