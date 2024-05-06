import 'package:e_commerce/src/feature/product/view_modle/product_view_model_cubit.dart';
import 'package:e_commerce/src/widget/custom_text_form_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ContainerSearchWidget extends StatelessWidget {
  const ContainerSearchWidget({
    super.key,
    required this.controller,
    required this.numberOfBages,
    required this.onTap,
  });

  final TextEditingController controller;
  final int numberOfBages;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormApp(
            hintText: 'what do you search for?',
            isSearch: true,
            validator: (text) {},
            controller: controller,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 8.h,
            ),
          ),
        ),
        Gap(7.w),
        InkWell(
          onTap: onTap,
          child: Badge(
            label: Text('$numberOfBages'),
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/icons/icon-shopping-cart.svg',
              width: 35.w,
              height: 35.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}