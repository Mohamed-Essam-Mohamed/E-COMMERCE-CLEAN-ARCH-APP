// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:e_commerce/src/constant/image_path_const.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CatergoryGridView extends StatelessWidget {
  CatergoryGridView({super.key});
  // List<dynamic> catergoryList = [
  //   imageCatergory1,
  //   imageCatergory2,
  //   imageCatergory3,
  //   imageCatergory4,
  //   imageCatergory5,
  //   imageCatergory6,
  // ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => Container(
        height: 150.h,
        width: 80.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.asset(
                imageCatergory2,
                fit: BoxFit.cover,
                height: 90.h,
                width: 90.w,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
            Gap(5.h),
            Text(
              "Women's fashion",
              style: AppTextStyle.textStyle18.copyWith(
                color: AppColors.primaryColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      itemCount: 20,
    );
  }
}
