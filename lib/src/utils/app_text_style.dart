import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle textStyle30 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 30.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textStyle24 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle18 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle14 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textStyle20 = TextStyle(
      color: AppColors.whiteColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300);
  static TextStyle textStyle13 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 13.sp,
  );
}
// textTheme: TextTheme(
//       titleLarge: TextStyle(
//         color: AppColors.whiteColor,
//         fontSize: 24.sp,
//         fontWeight: FontWeight.bold,
//       ),
//       titleMedium: TextStyle(
//           color: AppColors.whiteColor,
//           fontSize: 18.sp,
//           fontWeight: FontWeight.w500),
//       titleSmall: TextStyle(
//         color: AppColors.whiteColor,
//         fontSize: 13.sp,
//         fontWeight: FontWeight.w300,
//       ),
//     ),