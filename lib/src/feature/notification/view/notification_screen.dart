import 'dart:developer';

import 'package:e_commerce/src/feature/notification/local_notification/app_local_notification.dart';
import 'package:e_commerce/src/feature/notification/view_model/notification_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatefulWidget {
  static const routeName = 'notification-screen';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationViewModelCubit viewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = NotificationViewModelCubit();
    getNotificationHive();
  }

  void getNotificationHive() async {
    await viewModel.getAllNotificationHive();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    log("dispose notification screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        actions: [
          Icon(
            Icons.notifications,
            size: 30.sp,
            color: AppColors.primaryColor,
          ),
          Gap(10.w),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            BlocBuilder<NotificationViewModelCubit, NotificationViewModelState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is NotificationViewModelLoading) {
              return const Center(child: Text("Loading..."));
            }
            if (state is NotificationViewModelSuccess) {
              return viewModel.appLocalNotificationHiveList.isEmpty
                  ? _notificationScreenIsEmpty()
                  : _notificationListViewBuilder();
            }
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _notificationScreenIsEmpty() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_on,
            size: 50.sp,
            color: AppColors.primaryColor,
          ),
          Text(
            "Notification is empty",
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyle30.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(10.h),
          Text(
            "You don't have any notification yet",
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyle20.copyWith(
              color: AppColors.grayColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  ListView _notificationListViewBuilder() {
    return ListView.builder(
      reverse: true,
      itemCount: viewModel.appLocalNotificationHiveList.length,
      itemBuilder: (context, index) {
        return _notificationItem(
          appLocalNotification: viewModel.appLocalNotificationHiveList[index],
        );
      },
    );
  }

  Container _notificationItem(
      {required AppLocalNotification appLocalNotification}) {
    return Container(
      height: 80.h,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.w,
          color: AppColors.grayColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalNotification.title,
            style: AppTextStyle.textStyle20.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            appLocalNotification.body,
            style: AppTextStyle.textStyle18,
          ),
        ],
      ),
    );
  }
}
