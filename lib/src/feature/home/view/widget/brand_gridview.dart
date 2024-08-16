// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:e_commerce/src/domain/entities/home_entites/categoryorbrand_response_entity.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandGridView extends StatefulWidget {
  const BrandGridView({required this.allBrandsList, super.key});

  final List<CategoryOrBrandDataEntity> allBrandsList;

  @override
  State<BrandGridView> createState() => _BrandGridViewState();
}

class _BrandGridViewState extends State<BrandGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      gridDelegate: _gridDelegateWidget(),
      itemBuilder: (context, index) => _itemBrandWidget(index),
      itemCount: widget.allBrandsList.length,
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegateWidget() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      mainAxisExtent: 130,
    );
  }

  Widget _itemBrandWidget(int index) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.primaryColor,
      ),
      child: Text(
        widget.allBrandsList[index].name ?? '',
        style: AppTextStyle.textStyle18.copyWith(
          color: AppColors.whiteColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
