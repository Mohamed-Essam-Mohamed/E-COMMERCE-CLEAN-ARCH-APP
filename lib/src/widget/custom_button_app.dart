// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonApp extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final Color? colorText;
  void Function()? onPressed;
  CustomButtonApp({
    this.backgroundColor,
    required this.text,
    this.onPressed,
    this.colorText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3.h, left: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15.r),
        border: Border.all(color: AppColors.blackColor),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: colorText,
          ),
        ),
        height: 64.h,
        minWidth: double.infinity,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}
