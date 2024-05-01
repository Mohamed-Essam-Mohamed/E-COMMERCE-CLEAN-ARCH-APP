// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';

import 'package:e_commerce/src/feature/auth/login/view/reset_password_screen.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/widget/custom_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';

class ConFirmForgetEmailScreen extends StatefulWidget {
  static const String routeName = 'ConFirmForgetEmailScreen';
  const ConFirmForgetEmailScreen({super.key});

  @override
  State<ConFirmForgetEmailScreen> createState() => _ConFirmEmailScreenState();
}

class _ConFirmEmailScreenState extends State<ConFirmForgetEmailScreen> {
  bool isResendAgain = false;

  bool isVerified = false;

  bool isLoading = false;

  String code = '';

  late Timer timer;
  int start = 60;
  //////////////////////////////////////////
  void resend() {
    setState(() {
      isResendAgain = true;
    });

    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (start == 0) {
            isResendAgain = false;
            start = 60;
            timer.cancel();
          } else {
            start--;
          }
        });
      },
    );
  }

  void verify() {
    setState(() {
      isLoading = true;
    });
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        isLoading = false;
        isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(MediaQuery.of(context).size.height * 0.15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.81,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Gap(10.h),
                      Text(
                        "confirm your email",
                        style: AppTextStyle.textStyle30,
                        textAlign: TextAlign.center,
                      ),
                      Gap(40.h),
                      Text(
                        "Enter the code we sent to your email address",
                        style: AppTextStyle.textStyle18,
                      ),
                      Gap(23.h),
                      Text(
                        "we sent 6 digit code to your email address enter that code below",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      // Text(

                      Gap(25.h),
                      Center(
                        child: VerificationCode(
                          length: 6,
                          textStyle: AppTextStyle.textStyle18,
                          fullBorder: true,
                          // margin: EdgeInsets.all(5.sp),
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.sp,
                            vertical: 13.sp,
                          ),
                          underlineColor: AppColors.whiteColor,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          onCompleted: (value) {
                            code = value;
                          },
                          onEditing: (value) {},
                        ),
                      ),
                      Gap(20.h),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (isResendAgain) return;
                              resend();
                            },
                            child: Text(
                              isResendAgain == true
                                  ? "trye again" + start.toString()
                                  : "Send code again",
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Icon(Icons.send_rounded, color: Colors.blue),
                          Gap(1.w),
                        ],
                      ),
                      Gap(MediaQuery.of(context).size.height * 0.11),
                      CustomButtonApp(
                        onPressed: code.length < 6
                            ? null
                            : () {
                                Navigator.of(context).pushNamed(
                                  ResetPasswordScreen.routeName,
                                );
                              },
                        text: "Confirm",
                        backgroundColor: AppColors.whiteColor,
                        colorText: AppColors.blackColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
