import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/constant/box_hive_const.dart';
import 'package:e_commerce/src/data/api/api_manget.dart';
import 'package:e_commerce/src/data/model/response/product_response_dto/product_response_dto.dart';
import 'package:e_commerce/src/feature/notification/local_notification/app_local_notification.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
part 'notification_view_model_state.dart';

class NotificationViewModelCubit extends Cubit<NotificationViewModelState> {
  NotificationViewModelCubit() : super(NotificationViewModelInitial());
  ProductDataDto productItem = ProductDataDto();
  //? get product details
  Future<void> productItemDetails({required String productId}) async {
    emit(NotificationViewModelLoading());
    ApiManger apiManger = ApiManger.instance;
    var either = await apiManger.getProductItemDetails(productId: productId);
    either.fold((l) {
      emit(NotificationViewModelError(message: l.errorMessage ?? "Wrong"));
    }, (r) {
      productItem = r;
      emit(NotificationViewModelSuccess());
    });
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
