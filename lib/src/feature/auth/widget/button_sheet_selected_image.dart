import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';

class BottomSheetOptions extends StatelessWidget {
  BottomSheetOptions({
    super.key,
    required this.onPressedCamera,
    required this.onPressedGallery,
  });
  void Function()? onPressedCamera;

  void Function()? onPressedGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        color: AppColors.primaryColor,
      ),
      height: 190.h,
      width: double.infinity,
      child: Column(
        children: [
          Gap(10.h),
          Text(
            "Choose image",
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(10.h),
          _rowOptionSelectImage(
            icon: Icons.image,
            title: "Gallery",
            onPressed: onPressedGallery,
          ),
          _rowOptionSelectImage(
            icon: Icons.camera_alt_outlined,
            title: "Camera",
            onPressed: onPressedCamera,
          ),
        ],
      ),
    );
  }

  Row _rowOptionSelectImage(
      {required String title,
      required IconData icon,
      required void Function()? onPressed}) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: AppColors.whiteColor,
            size: 40.sp,
          ),
        ),
        Gap(10.h),
        Text(
          title,
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
