import 'package:e_commerce/src/animation/animation_show_welcom.dart';
import 'package:e_commerce/src/feature/auth/widget/login_or_signup.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../constant/string_const_app.dart';
import '../../../../domain/usecases/auth_usecases/rsegister_usecase.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/dailog.dart';
import '../../../../widget/custom_button_app.dart';
import '../../../../widget/custom_text_form_app.dart';
import '../../widget/sign_success_screen.dart';
import '../../widget/title_textfiel.dart';
import '../view_model_cubit/register_screen_view_model_cubit.dart';

//01020578625
class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModelCubit viewModel =
      RegisterViewModelCubit(registerUseCasese: injcectRegisterUseCasese());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModelCubit, RegisterViewModelState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterViewModelLoading) {
          DialogUtils.showLoading(context: context, message: loading);
        } else if (state is RegisterViewModelError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage ?? 'wrong',
          );
        } else if (state is RegisterViewModelSuccess) {
          DialogUtils.hideLoading(context);
          // print('${state.registerResponse?.message}');

          Navigator.of(context).pushReplacementNamed(SuccessScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            "Sign up",
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.grayColor,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: viewModel.formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(40.h),
                  Text(
                    "Register Account",
                    style: AppTextStyle.textStyle30,
                  ),
                  Gap(5.h),
                  Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Gap(30.h),
                  const TitleTextField(title: fullName),
                  CustomTextFormApp(
                    hintText: hintFullName,
                    isObscureText: false,
                    controller: viewModel.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return entFullName;
                      }
                      if (value.length <= 3) {
                        return invalidName;
                      }
                      return null;
                    },
                  ),
                  Gap(15.h),
                  const TitleTextField(title: mobileNumber),
                  CustomTextFormApp(
                    hintText: hintNumber,
                    controller: viewModel.mobileController,
                    isObscureText: false,
                    isPhone: true,
                    keyboardtype: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return entNumber;
                      }
                      return null;
                    },
                  ),
                  Gap(15.h),
                  TitleTextField(title: email),
                  CustomTextFormApp(
                    hintText: hintEmail,
                    controller: viewModel.emailController,
                    isObscureText: false,
                    keyboardtype: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return entEmail;
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return invalidEmail;
                      }
                      return null;
                    },
                  ),
                  Gap(15.h),
                  TitleTextField(title: password),
                  CustomTextFormApp(
                    hintText: hintPassword,
                    isObscureText: true,
                    controller: viewModel.passwordController,
                    showObscureText: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return entPassword;
                      }
                      bool emailValid = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value);
                      if (!emailValid) {
                        return weekPassword;
                      }
                    },
                  ),
                  Gap(30.h),
                  CustomButtonApp(
                    text: signUp,
                    colorText: AppColors.whiteColor,
                    onPressed: () {
                      viewModel.register();
                    },
                    backgroundColor: AppColors.primaryColor,
                  ),
                  Gap(32.h),
                  LoginOrSignUp(
                    startTitle: dontHaveAccount,
                    endTitle: "Sign In",
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
