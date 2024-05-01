import 'package:e_commerce/src/constant/string_const_app.dart';
import 'package:e_commerce/src/domain/usecases/login_usecases.dart';
import 'package:e_commerce/src/feature/auth/login/view/confirm_email_screen.dart';
import 'package:e_commerce/src/feature/auth/login/view_model/login_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/widget/custom_button_app.dart';
import 'package:e_commerce/src/widget/custom_text_form_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForGetPasswordScreen extends StatefulWidget {
  static const String routeName = 'ForGetPassword';

  @override
  State<ForGetPasswordScreen> createState() => _ForGetPasswordScreenState();
}

class _ForGetPasswordScreenState extends State<ForGetPasswordScreen> {
  LoginViewModelCubit viewModel =
      LoginViewModelCubit(loginUseCasese: injcectLoginUseCasese());
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModelCubit, LoginViewModelState>(
      bloc: viewModel,
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gap(MediaQuery.of(context).size.height * 0.2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    Gap(30.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        forgotPasswordTitle,
                        style: AppTextStyle.textStyle30,
                      ),
                    ),
                    Gap(60.h),
                    Text(
                      email,
                      style: AppTextStyle.textStyle18,
                    ),
                    Gap(20.h),
                    CustomTextFormApp(
                      hintText: entEmail,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return entEmail;
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return invalidEmail;
                        }
                        return null;
                      },
                      controller: viewModel.emailController,
                    ),
                    Gap(MediaQuery.of(context).size.height * 0.2),
                    CustomButtonApp(
                      text: sendCode,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ConFirmForgetEmailScreen.routeName,
                        );
                      },
                      backgroundColor: AppColors.whiteColor,
                    ),
                    Gap(240.h)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
