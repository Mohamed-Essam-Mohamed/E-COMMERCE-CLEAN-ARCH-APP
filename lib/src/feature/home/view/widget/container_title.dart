import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget {
  String title;

  Function()? onTap;
  ContainerTitle({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.textStyle20.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            'See all',
            style: AppTextStyle.textStyle14,
          ),
        )
      ],
    );
  }
}
