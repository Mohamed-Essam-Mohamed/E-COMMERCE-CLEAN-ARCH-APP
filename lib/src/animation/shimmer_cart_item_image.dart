import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCartItemImage extends StatelessWidget {
  const ShimmerCartItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 207, 207, 207),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        child: Container(
          height: 145.h,
          width: 130.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r)),
          ),
        ),
      ),
    );
  }
}
