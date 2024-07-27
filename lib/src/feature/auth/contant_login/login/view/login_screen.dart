// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:e_commerce/src/animation/animation_show_welcom.dart';
import 'package:e_commerce/src/constant/string_const_app.dart';
import 'package:e_commerce/src/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:e_commerce/src/feature/auth/contant_login/forget_password/view/forget_password_screen.dart';
import 'package:e_commerce/src/feature/auth/contant_login/login/view_model/login_view_model_cubit.dart';
import 'package:e_commerce/src/feature/auth/register/view/register_screen.dart';
import 'package:e_commerce/src/feature/auth/widget/login_or_signup.dart';
import 'package:e_commerce/src/feature/auth/widget/title_textfiel.dart';
import 'package:e_commerce/src/feature/navigation_bar_screen/navigation_bar_screen.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/utils/dailog.dart';
import 'package:e_commerce/src/widget/custom_button_app.dart';
import 'package:e_commerce/src/widget/custom_text_form_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModelCubit viewModel =
      LoginViewModelCubit(loginUseCases: injcectLoginUseCasese());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModelCubit, LoginViewModelState>(
      bloc: viewModel,
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginViewModelLoading) {
          DialogUtils.showLoading(context: context, message: loading);
        } else if (state is LoginViewModelError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage ?? 'wrong',
          );
        } else if (state is LoginViewModelSuccess) {
          DialogUtils.hideLoading(context);
          // print('${state.registerResponse?.message}');
          final player = Audio.load('assets/audio/success-1-6297.mp3');
          player.play();
          Navigator.of(context)
              .pushReplacementNamed(NavigationBarScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Sign in",
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.grayColor,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(90.h),
                CustomAnimatedText(
                  text: welcomeBack,
                  fontSize: 24.sp,
                ),
                Gap(5.h),
                Text(
                  loginToYourAccount,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.textStyle18,
                ),
                Gap(30.h),
                Form(
                  key: viewModel.fromState,
                  child: Column(
                    children: [
                      TitleTextField(title: email),
                      CustomTextFormApp(
                        hintText: hintEmail,
                        keyboardtype: TextInputType.emailAddress,
                        isObscureText: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return entEmail;
                          }
                          return null;
                        },
                        controller: viewModel.emailController,
                      ),
                      Gap(20.h),
                      TitleTextField(title: password),
                      CustomTextFormApp(
                        hintText: hintPassword,
                        showObscureText: true,
                        keyboardtype: TextInputType.text,
                        isObscureText: true,
                        controller: viewModel.passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return entPassword;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Gap(14.h),
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ForGetPasswordScreen.routeName);
                  },
                  child: Text(
                    forgotPassword,
                    style: AppTextStyle.textStyle18.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                Gap(50.h),
                CustomButtonApp(
                  onPressed: () {
                    viewModel.login();
                  },
                  text: login,
                  backgroundColor: AppColors.primaryColor,
                  colorText: AppColors.whiteColor,
                ),
                Gap(32.h),
                LoginOrSignUp(
                  startTitle: dontHaveAccount,
                  endTitle: signUp,
                  onTap: () =>
                      Navigator.of(context).pushNamed(RegisterScreen.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
