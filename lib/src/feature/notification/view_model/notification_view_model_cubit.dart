import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/constant/box_hive_const.dart';
import 'package:e_commerce/src/feature/notification/local_notification/app_local_notification.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
part 'notification_view_model_state.dart';

class NotificationViewModelCubit extends Cubit<NotificationViewModelState> {
  NotificationViewModelCubit() : super(NotificationViewModelInitial());
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
    log('notification id $id');
    await fLNotification.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  //! functions for hive notification
  List<AppLocalNotification> appLocalNotificationHiveList = [];
  var poxNotification = Hive.box<AppLocalNotification>(notifcationHive);
  Future<void> getAllNotificationHive() async {
    emit(NotificationViewModelLoading());
    appLocalNotificationHiveList = poxNotification.values.toList();
    emit(NotificationViewModelSuccess());
  }

  Future<void> addToNotificationHive({
    required String notificationId,
    required AppLocalNotification notification,
  }) async {
    await poxNotification.put(notificationId, notification);
    await getAllNotificationHive();
  }

  Future<void> deleteItemFavoriteHive({required String notificationId}) async {
    await poxNotification.delete(notificationId);
    await getAllNotificationHive();
  }
}
