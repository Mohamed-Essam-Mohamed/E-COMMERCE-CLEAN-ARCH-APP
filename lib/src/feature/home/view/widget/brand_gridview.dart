// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/animation/shimmmer_catergory_item.dart';
import 'package:e_commerce/src/domain/entities/home_entites/categoryorbrand_response_entity.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandGridView extends StatefulWidget {
  const BrandGridView({required this.brandList, super.key});

  final List<CategoryOrBrandDataEntity> brandList;

  @override
  State<BrandGridView> createState() => _BrandGridViewState();
}

class _BrandGridViewState extends State<BrandGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          color: AppColors.primaryColor,
        ),
        child: Text(
          widget.brandList[index].name ?? '',
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.whiteColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      itemCount: widget.brandList.length,
    );
  }
}
