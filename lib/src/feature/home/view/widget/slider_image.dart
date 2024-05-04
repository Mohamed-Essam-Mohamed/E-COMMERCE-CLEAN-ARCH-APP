import '../../../../constant/image_path_const.dart';
import '../../../../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderImages extends StatelessWidget {
  SliderImages({super.key});
  List<String> images = [
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
      onPageChanged: (value) {
        print('Page changed: $value');
      },

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
