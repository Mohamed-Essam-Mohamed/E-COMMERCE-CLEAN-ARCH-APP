import 'package:e_commerce/src/feature/auth/widget/title_textfiel.dart';

import '../../../../domain/usecases/rsegister_usecases.dart';
import '../../widget/sign_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../constant/string_const_app.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/dailog.dart';
import '../../../../widget/custom_button_app.dart';
import '../../../../widget/custom_text_form_app.dart';
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
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: viewModel.formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/image/route.png',
                    width: 200.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  Gap(50.h),
                  TitleTextField(title: fullName),
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
                    },
                  ),
                  Gap(15.h),
                  TitleTextField(title: mobileNumber),
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
                      if (value.length >= 8) {
                        return invalidStrongPassword;
                      }
                    },
                  ),
                  Gap(30.h),
                  CustomButtonApp(
                    text: signUp,
                    colorText: AppColors.primaryColor,
                    onPressed: () {
                      viewModel.register();
                    },
                    backgroundColor: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // String? validator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return entFullName;
  //   }
  //   if (value.length <= 3) {
  //     return invalidName;
  //   }
  // }
}
