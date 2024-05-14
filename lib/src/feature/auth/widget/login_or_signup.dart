import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../register/view/register_screen.dart';

class LoginOrSignUp extends StatelessWidget {
  final String startTitle;
  final String endTitle;

  const LoginOrSignUp({
    super.key,
    required this.endTitle,
    required this.startTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          startTitle,
          style: AppTextStyle.textStyle18.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).pushNamed(RegisterScreen.routeName);
          },
          child: Text(
            endTitle,
            style: AppTextStyle.textStyle20.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
