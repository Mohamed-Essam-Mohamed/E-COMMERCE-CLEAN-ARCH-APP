// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductScreen extends StatefulWidget {
  static const String routeName = "LoadingAnimation";

  const ShimmerProductScreen({super.key});
  @override
  State<ShimmerProductScreen> createState() => _ShimmerProductScreenState();
}

class _ShimmerProductScreenState extends State<ShimmerProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.83,
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 13,
                crossAxisSpacing: 13,
                childAspectRatio: 0.77,
              ),
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 207, 207, 207),
                highlightColor: Color.fromARGB(255, 255, 255, 255),
                child: Container(
                  height: 240.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.grayColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
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
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.h,
                          vertical: 5.h,
                        ),
                        child: Container(
                          height: 17,
                          width: 80,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 17,
                              width: 50,
                              color: Colors.grey.shade200,
                            ),
                            Spacer(),
                            Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(10.h),
                    ],
                  ),
                ),
              ),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
