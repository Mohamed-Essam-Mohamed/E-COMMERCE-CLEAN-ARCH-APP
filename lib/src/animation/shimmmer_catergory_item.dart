// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCatergoryItem extends StatefulWidget {
  static const String routeName = "ShimmerProductItemScreen";

  const ShimmerCatergoryItem({super.key});
  @override
  State<ShimmerCatergoryItem> createState() => _ShimmerCatergoryItemState();
}

class _ShimmerCatergoryItemState extends State<ShimmerCatergoryItem> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 207, 207, 207),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          height: 90.h,
          width: 90.w,
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
