import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 207, 207, 207),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: 100.h,
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
            mainAxisExtent: 130,
          ),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.shade200,
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
