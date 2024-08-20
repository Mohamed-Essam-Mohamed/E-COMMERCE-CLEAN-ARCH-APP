// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/animation/shimmmer_catergory_item.dart';
import 'package:e_commerce/src/constant/image_path_const.dart';
import 'package:e_commerce/src/domain/entities/home_entites/categoryorbrand_response_entity.dart';
import 'package:e_commerce/src/feature/home/view/specific_product_screen.dart';
import 'package:e_commerce/src/feature/product/view/product_screen.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({required this.allCategoryList, super.key});

  final List<CategoryOrBrandDataEntity> allCategoryList;

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _onTap(index),
        child: _itemCategoryWidget(index),
      ),
      itemCount: widget.allCategoryList.length,
    );
  }

  Widget _itemCategoryWidget(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: widget.allCategoryList[index].image ?? '',
                placeholder: (context, url) => ShimmerCatergoryItem(),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/image/download.jpg",
                ),
                fit: BoxFit.cover,
                height: 80.h,
                width: 80.w,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Gap(5.h),
          Text(
            widget.allCategoryList[index].name ?? '',
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.primaryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    Navigator.of(context).pushNamed(
      SpecificProductScreen.routeName,
      arguments: widget.allCategoryList[index].id,
    );
  }
}
