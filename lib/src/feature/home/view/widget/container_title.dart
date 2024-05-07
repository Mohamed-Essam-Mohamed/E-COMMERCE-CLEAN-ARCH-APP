import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';

class ContainerTitle extends StatefulWidget {
  String title;

  Function()? onTap;
  ContainerTitle({super.key, required this.onTap, required this.title});

  @override
  State<ContainerTitle> createState() => _ContainerTitleState();
}

class _ContainerTitleState extends State<ContainerTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: AppTextStyle.textStyle20.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: widget.onTap,
          child: Text(
            'See all',
            style: AppTextStyle.textStyle14,
          ),
        )
      ],
    );
  }
}
