// import 'dart:developer';

// import 'package:e_commerce/src/feature/notification/view_model/notification_view_model_cubit.dart';
// import 'package:workmanager/workmanager.dart';

// class WorkManagerService {
//   static Future<void> init() async {
//     await Workmanager().initialize(
//       callbackDispatcher,
//       isInDebugMode: true,
//     );

//     await Workmanager().registerOneOffTask(
//       "1",
//       "welcome",
//     );
//   }

//   void cancelTask(String id) async {
//     await Workmanager().cancelByUniqueName(id);
//   }
// }

// ///
// @pragma('vm:entry-point')
// void callbackDispatcher() async {
//   log("callbackDispatcher");
//   Workmanager().executeTask(
//     (task, inputData) async {
//       await NotificationViewModelCubit().showBasicNotification(
//         title: 'Welcome TOKOTO',
//         body: 'TOKOTO APP Where All New With Us',
//         id: 0,
//         payload: 'Welcome TOKOTO',
//       );
//       // simpleTask will be emitted here.
//       return Future.value(true);
//     },
//   );
// }
