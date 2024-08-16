import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeScreen extends StatelessWidget {
  const ShimmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 207, 207, 207),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: 280.h,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    height: 90.h,
                    width: 90.w,
                    color: Colors.grey.shade200,
                  ),
                ),
                Gap(5.h),
                Container(
                  height: 10.h,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
