// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductItemImage extends StatefulWidget {
  static const String routeName = "ShimmerProductItemScreen";

  const ShimmerProductItemImage({super.key});
  @override
  State<ShimmerProductItemImage> createState() =>
      _ShimmerProductItemImageState();
}

class _ShimmerProductItemImageState extends State<ShimmerProductItemImage> {
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
          height: 160.h,
          width: double.infinity,
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
