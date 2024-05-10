import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProcucteDetails extends StatelessWidget {
  const ShimmerProcucteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 207, 207, 207),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: AppColors.grayColor,
              width: 2,
            ),
          ),
          child: Container(
            color: AppColors.grayColor,
            height: 300.h,
            width: double.infinity,
          )),
    );
  }
}
