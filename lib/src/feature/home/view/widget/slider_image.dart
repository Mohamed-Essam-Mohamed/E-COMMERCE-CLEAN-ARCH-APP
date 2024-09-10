import 'package:e_commerce/src/data/dummy_class/offer_product.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/widget/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../utils/app_colors.dart';

class SliderImages extends StatelessWidget {
  SliderImages({
    super.key,
  });

  List<OfferProduct> products = OfferProduct.offerProductList();
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200.h,
      initialPage: 1,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.grayColor,
      autoPlayInterval: 5000,
      isLoop: true,
      children: products
          .map(
            (url) => SliderItemWidget(
              productItem: url,
            ),
          )
          .toList(),
    );
  }
}

class SliderItemWidget extends StatelessWidget {
  const SliderItemWidget({
    super.key,
    required this.productItem,
  });
  final OfferProduct productItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage(productItem.imageCover!),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "UP TO",
              style: AppTextStyle.textStyle24.copyWith(
                fontWeight: FontWeight.bold,
                color: productItem.isBlueColor!
                    ? AppColors.primaryColor
                    : Colors.white,
                height: 0,
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${productItem.offerProduct}%",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: productItem.isBlueColor!
                          ? AppColors.primaryColor
                          : Colors.white,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: " OFF",
                    style: AppTextStyle.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                      color: productItem.isBlueColor!
                          ? AppColors.primaryColor
                          : Colors.white,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${productItem.offerString!.split('&')[0]}",
              style: AppTextStyle.textStyle20.copyWith(
                fontWeight: FontWeight.w400,
                color: productItem.isBlueColor!
                    ? AppColors.primaryColor
                    : Colors.white,
                height: 0,
              ),
            ),
            Text(
              "& ${productItem.offerString!.split('&')[1]}",
              style: AppTextStyle.textStyle20.copyWith(
                fontWeight: FontWeight.w400,
                color: productItem.isBlueColor!
                    ? AppColors.primaryColor
                    : Colors.white,
                height: 0,
              ),
            ),
            Gap(1.h),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      argsData: productItem,
                      imageTest: productItem.imageCover!,
                    ),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              color: productItem.isBlueColor!
                  ? AppColors.primaryColor
                  : Colors.white,
              child: Text(
                "Shop Now",
                style: AppTextStyle.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                  color: productItem.isBlueColor!
                      ? Colors.white
                      : AppColors.primaryColor,
                  height: 0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
