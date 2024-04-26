// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';

class ContainerItem extends StatelessWidget {
  String pathImage;
  String descriptionImage;
  String price;
  void Function()? onTapLove;
  void Function()? onTapAddCard;

  ContainerItem({
    Key? key,
    required this.pathImage,
    required this.descriptionImage,
    required this.price,
    required this.onTapLove,
    required this.onTapAddCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 175.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                child: Image.asset(
                  pathImage,
                  width: double.infinity,
                  height: 140.h,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                right: -3,
                child: InkWell(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: onTapLove,
                  child: SvgPicture.asset(
                    'assets/icons/icon-like-unselected.svg',
                    width: 46.w,
                    height: 46.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 5.h,
            ),
            child: Text(
              descriptionImage,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.textStyle18.copyWith(
                color: AppColors.primaryColor,
                height: 0,
              ),
            ),
          ),
          Gap(7.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  price,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textStyle18.copyWith(
                    color: AppColors.primaryColor,
                    height: 0,
                  ),
                ),
                Spacer(),
                InkWell(
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: onTapAddCard,
                  child: SvgPicture.asset(
                    'assets/icons/icon-add.svg',
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
