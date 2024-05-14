import 'dart:async';

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../contant_login/login/view/login_screen.dart';

class SuccessScreen extends StatefulWidget {
  static String routeName = "SignSuccessScreen";

  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final player = Audio.load('assets/audio/success-1-6297.mp3');
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      },
    );
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(30.h),
              Image.asset(
                "assets/image/success.png",
                height: MediaQuery.of(context).size.height * 0.4, //40%
              ),
              Spacer(),
              Text(
                "Login Success",
                style: AppTextStyle.textStyle24.copyWith(
                  color: Color(0xffff8c40),
                  fontSize: 40.sp,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
