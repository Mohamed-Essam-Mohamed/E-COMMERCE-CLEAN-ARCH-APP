import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TitleTextField extends StatelessWidget {
  TitleTextField({required this.title, super.key});
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.whiteColor,
            ),
          ),
          Gap(10.h),
        ],
      ),
    );
  }
}
