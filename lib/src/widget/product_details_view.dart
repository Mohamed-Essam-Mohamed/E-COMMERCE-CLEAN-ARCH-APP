import '../domain/entities/product_entites/product_response_entity.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatelessWidget {
  static String routeName = "ProductDetailsView";

  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ProductDataEntity;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Product details"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        titleTextStyle: AppTextStyle.textStyle20.copyWith(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/icon-search.svg'),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/icon-shopping-cart.svg'),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppColors.grayColor,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: AppColors.primaryColor,
                    indicatorBackgroundColor: AppColors.whiteColor,
                    indicatorBottomPadding: 20.h,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: args.images!
                        .map((url) => FadeInImage.assetNetwork(
                              placeholder: "assets/image/image_slider_1.png",
                              image: url,
                              fit: BoxFit.cover,
                              height: 300.h,
                              width: double.infinity,
                            ))
                        .toList(),
                  ),
                ),
              ),
              Gap(24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      args.title ?? '',
                      style: AppTextStyle.textStyle18.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    "EGP ${args.price}",
                    style: AppTextStyle.textStyle18.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
              Gap(16.h),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Sold : ${args.sold}",
                            style: AppTextStyle.textStyle14.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gap(16.w),
                        SvgPicture.asset("assets/icons/icon-start.svg"),
                        Gap(4.w),
                        Text(
                          "${args.ratingsAverage}",
                          style: AppTextStyle.textStyle14.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50.h,
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 28.sp,
                          ),
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
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
              Gap(25.h),
              Text(
                "Description",
                style: AppTextStyle.textStyle18.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(10.h),
              ReadMoreText(
                args.description ?? '',
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: AppTextStyle.textStyle20.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400,
                ),
                trimCollapsedText: ' Show More',
                trimExpandedText: ' Show Less',
                moreStyle: AppTextStyle.textStyle14.copyWith(
                  color: AppColors.primaryColor,
                ),
                lessStyle: AppTextStyle.textStyle14.copyWith(
                  color: AppColors.redColor,
                ),
              ),
              Gap(130.h),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total price",
                        style: AppTextStyle.textStyle18.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Gap(5.h),
                      Text(
                        "EGP ${args.price}",
                        style: AppTextStyle.textStyle18.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(32.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            color: AppColors.whiteColor,
                          ),
                          Text(
                            "Add to cart",
                            style: AppTextStyle.textStyle18,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
