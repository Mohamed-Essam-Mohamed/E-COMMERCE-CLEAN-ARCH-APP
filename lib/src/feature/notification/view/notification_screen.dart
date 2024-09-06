import 'dart:developer';

import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = 'notification-screen';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        child: Container(
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
                "Title",
                style: AppTextStyle.textStyle20.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Description",
                style: AppTextStyle.textStyle18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
