// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/animation/shimmmer_catergory_item.dart';
import 'package:e_commerce/src/domain/entities/home_entites/categoryorbrand_response_entity.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CatergoryGridView extends StatefulWidget {
  const CatergoryGridView({required this.catergoryList, super.key});

  final List<CategoryOrBrandDataEntity> catergoryList;

  @override
  State<CatergoryGridView> createState() => _CatergoryGridViewState();
}

class _CatergoryGridViewState extends State<CatergoryGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
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
              child: CachedNetworkImage(
                imageUrl: widget.catergoryList[index].image ?? '',
                placeholder: (context, url) => ShimmerCatergoryItem(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                height: 90.h,
                width: 90.w,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
            Gap(5.h),
            Text(
              widget.catergoryList[index].name ?? '',
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
      itemCount: widget.catergoryList.length,
    );
  }
}
