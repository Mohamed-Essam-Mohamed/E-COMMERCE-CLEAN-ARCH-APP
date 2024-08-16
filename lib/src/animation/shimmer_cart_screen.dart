import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmmerCartScreen extends StatelessWidget {
  static const String routeName = "ShimmmerCartScreen";
  const ShimmmerCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 207, 207, 207),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(16.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  width: 1.w,
                  color: AppColors.grayColor,
                ),
              ),
              height: 145.h,
              width: 300.w,
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
