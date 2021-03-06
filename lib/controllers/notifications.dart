import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class Notifications {
  ///This function starts a [NotificationChannel] and handles required permissions for notifications

  static void init() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    }).whenComplete(() {
      AwesomeNotifications().initialize(
          'resource://drawable/res_azan',
          [
            NotificationChannel(
                enableVibration: true,
                playSound: true,
                importance: NotificationImportance.High,
                locked: false,
                defaultRingtoneType: DefaultRingtoneType.Notification,
                channelGroupKey: 'basic_channel_group',
                channelKey: 'basic_channel',
                channelName: 'Basic notifications',
                channelDescription: 'Notification channel for basic tests',
                // defaultColor: Colors.blue.shade800,
                channelShowBadge: true,
                enableLights: true,
                ledColor: Colors.white)
          ],
          channelGroups: [
            NotificationChannelGroup(
                channelGroupkey: 'basic_channel_group',
                channelGroupName: 'Basic group')
          ],
          debug: true);
    });
  }

  ///It shows a notification indicating the success status of getting the timings from the API
  static void success() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      icon: 'resource://drawable/res_azan',
      roundedBigPicture: false,
      criticalAlert: true,
      showWhen: false,
      summary: 'Success',
      notificationLayout: NotificationLayout.Inbox,
      fullScreenIntent: true,
      id: 1,
      channelKey: 'basic_channel',
      title: 'Timings updated  ' +
          Emojis.smile_smiling_face +
          ' ' +
          Emojis.smile_smiling_face,
      body: 'Successfull update for timings',
    ));
  }

  ///It shows a notification indicating the failure status of getting the timings from the API
  static void failed() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      roundedBigPicture: false,
      icon: 'resource://drawable/res_azan',
      criticalAlert: true,
      showWhen: false,
      summary: 'Fail',
      notificationLayout: NotificationLayout.Inbox,
      fullScreenIntent: false,
      id: 2,
      channelKey: 'basic_channel',
      title: 'Timings hasn\'t updated  ' +
          Emojis.smile_pensive_face +
          ' ' +
          Emojis.smile_pensive_face,
      body: 'Timings hasn\'t updated , Please check your internet connection',
    ));
  }
}
