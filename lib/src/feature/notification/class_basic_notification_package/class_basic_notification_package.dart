import 'dart:async';

import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ClassBasicNotificationPackage {
  static FlutterLocalNotificationsPlugin fLNotification =
      FlutterLocalNotificationsPlugin();
  //! connected onTap function notification to ui screen
  //?  1
  static StreamController<NotificationResponse> controller = StreamController();
  //?  2
  static onTap(NotificationResponse details) {
    controller.add(details);
  }

  //? init notification
  static Future init() async {
    InitializationSettings initSettings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    fLNotification.initialize(
      initSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  //? show notification
  Future<void> showBasicNotification({
    required String title,
    required String body,
    required int id,
    required String payload,
  }) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'welcome app TOKOTO',
        //? show when app is in foreground
        importance: Importance.max,
        priority: Priority.high,
        color: AppColors.primaryColor,
        colorized: true,
        enableLights: true,

        icon: '@mipmap/ic_launcher',
      ),
    );
    await fLNotification.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
