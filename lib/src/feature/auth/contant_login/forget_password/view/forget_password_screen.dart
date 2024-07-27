import '../../../../../constant/string_const_app.dart';
import '../../../../../domain/usecases/auth_usecases/forgot_pass_usecase.dart';
import '../view_model/forgot_password_cubit.dart';
import '../../reset_code/view/resend_code_email_screen.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_text_style.dart';
import '../../../../../utils/dailog.dart';
import '../../../../../widget/custom_button_app.dart';
import '../../../../../widget/custom_text_form_app.dart';
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
  ForgotPasswordCubit viewModel = ForgotPasswordCubit(
      forgotPasswordUseCases: injectForgotPasswordUseCases());

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          DialogUtils.showLoading(context: context, message: "loading...");
        } else if (state is ForgotPasswordError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage ?? 'wrong',
          );
        } else if (state is ForgotPasswordSuccess) {
          DialogUtils.hideLoading(context);
          Navigator.of(context).pushNamed(
            ResendCodeEmailScreen.routeName,
            arguments: DataClassEmail(email: viewModel.emailController.text),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Forgot Password",
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.grayColor,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
        ),
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gap(MediaQuery.of(context).size.height * 0.2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
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
                    Form(
                      key: viewModel.fromState,
                      child: CustomTextFormApp(
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
                    ),
                    Gap(MediaQuery.of(context).size.height * 0.2),
                    CustomButtonApp(
                      text: sendCode,
                      onPressed: () {
                        viewModel.forgotPassword();
                      },
                      backgroundColor: AppColors.primaryColor,
                      colorText: AppColors.whiteColor,
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

class DataClassEmail {
  String email;
  DataClassEmail({required this.email});
}
