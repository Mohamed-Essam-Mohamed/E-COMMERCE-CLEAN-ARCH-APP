import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCartItem extends StatelessWidget {
  final FavoriteDataEntity favoriteDataEntity;
  const FavoriteCartItem({
    super.key,
    required this.favoriteDataEntity,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.grayColor,
          ),
        ),
        width: double.infinity,
        height: 145.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r)),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/image/image_slider_1.png",
                image: favoriteDataEntity.imageCover ?? "",
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              favoriteDataEntity.title ?? "",
                              style: AppTextStyle.textStyle18.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // logic here
                            },
                            child: SvgPicture.asset(
                              'assets/icons/icon-like-selected.svg',
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'EGP ${favoriteDataEntity.price}',
                              style: AppTextStyle.textStyle18.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Container(
                              height: 80.h,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  100.r,
                                ),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      // var counter = getProduct.count ?? 0;
                                      // counter--;
                                      // bloc.upadateCountCartItme(
                                      //   cartId: getProduct.product?.id ?? '',
                                      //   count: counter.toString(),
                                      // );
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: AppColors.whiteColor,
                                      size: 28.sp,
                                    ),
                                  ),
                                  Text(
                                    ' 1',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      // var counter = getProduct.count ?? 0;
                                      // counter++;
                                      // bloc.upadateCountCartItme(
                                      //   cartId: getProduct.product?.id ?? '',
                                      //   count: counter.toString(),
                                      // );
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_rounded,
                                      color: AppColors.whiteColor,
                                      size: 28.sp,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}