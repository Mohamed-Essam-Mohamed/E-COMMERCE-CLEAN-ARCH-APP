import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/constant/box_hive_const.dart';
import 'package:e_commerce/src/feature/notification/local_notification/app_local_notification.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
part 'notification_view_model_state.dart';

class NotificationViewModelCubit extends Cubit<NotificationViewModelState> {
  NotificationViewModelCubit() : super(NotificationViewModelInitial());

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
