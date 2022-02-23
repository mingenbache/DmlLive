// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:awesome_notifications/awesome_notifications.dart';

Future awesomeNotification(int id) async {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'scheduled_channel_group',
            channelKey: 'scheduled',
            channelName: 'Scheduled notifications',
            channelDescription: 'Notification channel for scheduled tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'scheduled_channel_group',
            channelGroupName: 'Scheduled group')
      ],
      debug: true);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'scheduled',
        title: 'wait 5 seconds to show',
        body: 'now is 5 seconds later',
        wakeUpScreen: true,
        category: NotificationCategory.Alarm,
      ),
      schedule: NotificationInterval(
          interval: 5, timeZone: localTimeZone, preciseAlarm: true));
}
