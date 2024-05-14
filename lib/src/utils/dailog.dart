import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'app_colors.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              Gap(10.w),
              Text(message),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Text('ok'),
            )
          ],
          title: Icon(
            Icons.warning_amber,
            color: AppColors.redColor,
            size: 30.sp,
          ),
          content: Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      width: 300.w,
      duration: const Duration(milliseconds: 300),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
