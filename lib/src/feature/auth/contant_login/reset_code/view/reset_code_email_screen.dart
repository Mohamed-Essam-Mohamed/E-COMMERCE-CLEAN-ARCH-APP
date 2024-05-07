// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:e_commerce/src/domain/usecases/auth_usecases/reset_code_usecase.dart';
import 'package:e_commerce/src/feature/auth/contant_login/forget_password/view/forget_password_screen.dart';
import 'package:e_commerce/src/feature/auth/contant_login/reset_code/view_model/reset_code_view_model_cubit.dart';
import 'package:e_commerce/src/feature/auth/contant_login/reset_password/view/reset_password_screen.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/utils/dailog.dart';
import 'package:e_commerce/src/widget/custom_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';

class ResendCodeEmailScreen extends StatefulWidget {
  static const String routeName = 'ConFirmForgetEmailScreen';
  const ResendCodeEmailScreen({super.key});

  @override
  State<ResendCodeEmailScreen> createState() => _ConFirmEmailScreenState();
}

class _ConFirmEmailScreenState extends State<ResendCodeEmailScreen> {
  ResetCodeViewModelCubit viewModel =
      ResetCodeViewModelCubit(resetCodeUseCases: injectResetCodeUseCases());
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as DataClassEmail;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocListener<ResetCodeViewModelCubit, ResetCodeViewModelState>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is ResetCodeViewModelLoading) {
              DialogUtils.showLoading(context: context, message: "loading...");
            } else if (state is ResetCodeViewModelError) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                  context: context, message: state.errorMessage ?? "wrong");
            } else if (state is ResetCodeViewModelSuccess) {
              DialogUtils.hideLoading(context);
              Navigator.of(context).pushNamed(ResetPasswordScreen.routeName,
                  arguments: DataClassEmail(email: args.email));
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.fromState,
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
                            "we sent 6 digit code to your\n${args.email}\nenter that code below",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          // Text(

                          Gap(25.h),
                          Center(
                            child: VerificationCode(
                              length: 6,
                              textStyle: AppTextStyle.textStyle18,
                              fullBorder: true,
                              margin: EdgeInsets.all(1.sp),
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.sp,
                                vertical: 13.sp,
                              ),
                              underlineColor: AppColors.whiteColor,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              onCompleted: (value) {
                                viewModel.code = value;
                                print(value);
                              },
                              onEditing: (value) {
                                print('${value} onEditing');
                              },
                            ),
                          ),
                          Gap(20.h),
                          Gap(MediaQuery.of(context).size.height * 0.11),
                          CustomButtonApp(
                            onPressed: viewModel.code.length < 6
                                ? null
                                : () {
                                    print(viewModel.code);
                                    viewModel.resetCode();
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
            ),
          )),
    );
  }
}
