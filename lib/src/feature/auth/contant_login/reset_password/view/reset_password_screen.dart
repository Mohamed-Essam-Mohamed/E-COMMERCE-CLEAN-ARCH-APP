import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/string_const_app.dart';
import '../../../../../domain/usecases/auth_usecases/reset_pass_usecase.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_text_style.dart';
import '../../../../../utils/dailog.dart';
import '../../../../../widget/custom_button_app.dart';
import '../../../../../widget/custom_text_form_app.dart';
import '../../../../navigation_bar_screen/navigation_bar_screen.dart';
import '../../forget_password/view/forget_password_screen.dart';
import '../view_model/reset_password_view_model_cubit.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = 'ResetPasswordScreen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordViewModelCubit viewModel = ResetPasswordViewModelCubit(
      resetPasswordUseCases: injectResetPasswordUseCases());
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as DataClassEmail;
    return BlocListener<ResetPasswordViewModelCubit,
        ResetPasswordViewModelState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetPasswordViewModelLoading) {
          DialogUtils.showLoading(context: context, message: "loading...");
        } else if (state is ResetPasswordViewModelError) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage ?? 'wrong',
          );
        } else if (state is ResetPasswordViewModelSuccess) {
          DialogUtils.hideLoading(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
              NavigationBarScreen.routeName, (route) => false);
        }
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
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: viewModel.fromState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Gap(30.h),
                      Text(
                        changePassword,
                        style: AppTextStyle.textStyle30,
                        textAlign: TextAlign.center,
                      ),
                      Gap(15.h),
                      Text(
                        args.email,
                        style: AppTextStyle.textStyle14.copyWith(
                          color: AppColors.grayColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Gap(50.h),
                      Text(
                        newPassword,
                        style: AppTextStyle.textStyle18,
                      ),
                      Gap(20.h),
                      CustomTextFormApp(
                        isObscureText: true,
                        showObscureText: true,
                        hintText: password,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return entPassword;
                          }
                          bool emailValid = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(text);
                          if (!emailValid) {
                            return weekPassword;
                          }
                          return null;
                        },
                        controller: viewModel.passwordController,
                      ),
                      Gap(20.h),
                      Text(
                        confirmPassword,
                        style: AppTextStyle.textStyle18,
                      ),
                      Gap(20.h),
                      CustomTextFormApp(
                        isObscureText: true,
                        showObscureText: true,
                        hintText: confirmPassword,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return samePassword;
                          }

                          if (viewModel.passwordController ==
                              viewModel.confirmPasswordController) {
                            return notMatchPassword;
                          }
                          return null;
                        },
                        controller: viewModel.confirmPasswordController,
                      ),
                      Gap(MediaQuery.of(context).size.height * 0.2),
                      CustomButtonApp(
                        text: resetPassword,
                        onPressed: () {
                          viewModel.resetPassword(email: args.email);
                        },
                        backgroundColor: AppColors.whiteColor,
                      ),
                      Gap(240.h)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
