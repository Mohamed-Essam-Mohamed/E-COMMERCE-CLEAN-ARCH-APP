import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
  // static void showMessage(BuildContext context, String message,
  //     {String title = 'Title',
  //     String? posActionName,
  //     VoidCallback? posAction,
  //     String? negActionName,
  //     VoidCallback? negAction,
  //     bool isDismissable = false}) {
  //   List<Widget> actions = [];
  //   if (posActionName != null) {
  //     actions.add(TextButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //           posAction?.call();
  //         },
  //         child: Text(posActionName)));
  //     if (negActionName != null) {
  //       actions.add(TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             posAction?.call();
  //           },
  //           child: Text(negActionName)));
  //     }
  //     showDialog(
  //       context: context,
  //       barrierDismissible: isDismissable,
  //       builder: ((context) {
  //         return AlertDialog(
  //           title: Text(
  //             title,
  //             style: AppTextStayl.textStyle22.copyWith(
  //               color: AppColors.priamryColor,
  //             ),
  //           ),
  //           content: Text(
  //             message,
  //             style: AppTextStayl.textStyle16,
  //           ),
  //           actions: actions,
  //           titleTextStyle:
  //               TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
  //         );
  //       }),
  //     );
  //   }
  // }
}
