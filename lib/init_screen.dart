import 'package:e_commerce/src/animation/animation_show_welcom.dart';
import 'package:e_commerce/src/constant/string_const_app.dart';
import 'package:e_commerce/src/feature/auth/contant_login/login/view/login_screen.dart';
import 'package:e_commerce/src/feature/auth/register/view/register_screen.dart';
import 'package:e_commerce/src/feature/navigation_bar_screen/navigation_bar_screen.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/widget/custom_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InitScreen extends StatelessWidget {
  static const String routeName = "WelcomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 64.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.topLeft,
              child: CustomAnimatedText(
                text: welcom,
                fontSize: 30.sp,
              ),
            ),
            Gap(20.h),
            Text(
              descriptionWelcom,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyle18,
            ),
            const Spacer(),
            CustomButtonApp(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
              text: login,
              backgroundColor: AppColors.primaryColor,
              colorText: AppColors.whiteColor,
            ),
            Gap(20.h),
            CustomButtonApp(
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterScreen.routeName);
              },
              text: signUp,
              colorText: AppColors.primaryColor,
            ),
            Gap(20.h),
            CustomButtonApp(
              onPressed: () {
                Navigator.of(context).pushNamed(NavigationBarScreen.routeName);
              },
              text: skip,
              colorText: AppColors.primaryColor,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
