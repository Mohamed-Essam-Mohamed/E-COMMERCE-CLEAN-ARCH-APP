import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/constant/box_hive_const.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_product_item.dart';
import 'package:e_commerce/src/feature/notification/local_notification/app_local_notification.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
part 'notification_view_model_state.dart';

class NotificationViewModelCubit extends Cubit<NotificationViewModelState> {
  late GetProductItemUseCase getProductItemDetails;

  NotificationViewModelCubit() : super(NotificationViewModelInitial()) {
    getProductItemDetails = injectGetProductItemUseCase();
  }

  ProductDataEntity? productItem;
  //? get product details
  Future<void> productItemDetails({required String productId}) async {
    emit(NotificationViewModelLoading());
    var either = await getProductItemDetails.invoke(productId: productId);
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
