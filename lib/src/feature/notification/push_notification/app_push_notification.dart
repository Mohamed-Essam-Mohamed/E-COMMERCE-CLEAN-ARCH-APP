import 'dart:developer';
import 'dart:ffi';

import 'package:e_commerce/src/feature/notification/view_model/notification_view_model_cubit.dart';
import 'package:e_commerce/src/utils/shared_preference_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AppPushNotification {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  var user = SharedPreferencesUtils.getData(key: 'Token');

  String? token;

  Future initialize() async {
    await messaging.requestPermission();
    await onBackgroundMessageFunction();
    await onMessageFunction();
    token = await messaging.getToken();
    if (user != null) {
      //! create topic for notification
      messaging.subscribeToTopic("all").then((value) {
        log("create topic for notification");
      });
    } else {
      //! un subscribe from topic
      messaging.unsubscribeFromTopic("all").then((value) {
        log("un subscribe from topic");
      });
    }
    log("token: $token");
  }

  Future onBackgroundMessageFunction() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future onMessageFunction() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.notification?.title}');
      log('payload data: ${message.data["payload"]}');
      NotificationViewModelCubit().showBasicNotification(
        body: message.notification?.body ?? '',
        id: 0,
        payload: message.data["payload"] ?? "6428ebc6dc1175abc65ca0b9",
        title: message.notification?.title ?? '',
      );
    });
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Handling a background message: ${message.messageId}");
}
