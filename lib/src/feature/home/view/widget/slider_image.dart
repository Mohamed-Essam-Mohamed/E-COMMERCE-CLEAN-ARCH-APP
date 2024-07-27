import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/constant/image_path_const.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/app_colors.dart';

class SliderImages extends StatelessWidget {
  SliderImages({
    super.key,
  });
  final List<String> images = [
    imageSlider1,
    imageSlider2,
    imageSlider3,
  ];
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200.h,
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.grayColor,
      autoPlayInterval: 3000,

      isLoop: true,
      onPageChanged: (value) {},

      children: images
          .map(
            (url) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image:
                    DecorationImage(image: AssetImage(url), fit: BoxFit.fill),
              ),
            ),
          )
          .toList(),

      /// Called whenever the page in the center of the viewport changes.
    );
  }
}

class ContainerImaWidget extends StatelessWidget {
  const ContainerImaWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => const ShimmerSliderImage(),
        errorWidget: (context, url, error) =>
            Image.asset('assets/image/item_2.png'),
        width: double.infinity,
        height: 140.h,
        fit: BoxFit.fill,
      ),
    );
  }
}

class ShimmerSliderImage extends StatelessWidget {
  const ShimmerSliderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 207, 207, 207),
      highlightColor: Color.fromARGB(255, 255, 255, 255),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          height: 160.h,
          width: double.infinity,
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
