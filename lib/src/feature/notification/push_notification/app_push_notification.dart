import 'package:e_commerce/src/feature/notification/class_basic_notification_package/class_basic_notification_package.dart';
import 'package:e_commerce/src/feature/notification/local_notification/app_local_notification.dart';
import 'package:e_commerce/src/feature/notification/view_model/notification_view_model_cubit.dart';
import 'package:e_commerce/src/utils/shared_preference_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid().v4();

class AppPushNotification {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationViewModelCubit notificationViewModelCubit =
      NotificationViewModelCubit();

  var user = SharedPreferencesUtils.getData(key: 'Token');

  String? token;

  Future initialize() async {
    await messaging.requestPermission();
    await onBackgroundMessageFunction();
    await onMessageFunction();
    token = await messaging.getToken();
    if (user != null) {
      //! create topic for notification
      messaging.subscribeToTopic("all");
    } else {
      //! un subscribe from topic
      messaging.unsubscribeFromTopic("all");
    }
  }

  Future onBackgroundMessageFunction() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future onMessageFunction() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await ClassBasicNotificationPackage().showBasicNotification(
        body: message.notification?.body ?? '',
        id: 0,
        payload: message.data["payload"],
        title: message.notification?.title ?? '',
      );
      await notificationViewModelCubit.addToNotificationHive(
        notificationId: uuid,
        notification: AppLocalNotification(
          id: uuid,
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          payload: message.data["payload"],
          dateTime: DateTime.now(),
        ),
      );
    });
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationViewModelCubit().addToNotificationHive(
    notificationId: uuid,
    notification: AppLocalNotification(
      id: uuid,
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: message.data["payload"],
      dateTime: DateTime.now(),
    ),
  );
}
