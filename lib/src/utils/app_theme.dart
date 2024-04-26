// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
