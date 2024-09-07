import 'dart:io';

import 'package:e_commerce/src/animation/animation_show_welcom.dart';
import 'package:e_commerce/src/feature/auth/widget/button_sheet_selected_image.dart';
import 'package:e_commerce/src/feature/auth/widget/login_or_signup.dart';
import 'package:e_commerce/src/feature/notification/view_model/notification_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/utils/image_fucntions.dart';
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
  late RegisterViewModelCubit viewModel;
  @override
  void initState() {
    super.initState();
    viewModel =
        RegisterViewModelCubit(registerUseCasese: injcectRegisterUseCasese());
  }

  @override
  void dispose() async {
    super.dispose();
    viewModel.emailController.dispose();
    viewModel.passwordController.dispose();
    viewModel.nameController.dispose();
    viewModel.mobileController.dispose();
    viewModel.close();
    await NotificationViewModelCubit().showBasicNotification(
      title: 'Welcome TOKOTO',
      body: 'TOKOTO APP Where All New With Us',
      id: 0,
      payload: 'Welcome TOKOTO',
    );
  }

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
                  Text(
                    "Register Account",
                    style: AppTextStyle.textStyle30,
                  ),
                  Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Gap(10.h),
                  _selectedImageSectionWidget(),
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
                  Gap(10.h),
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
                  Gap(10.h),
                  const TitleTextField(title: email),
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
                  Gap(10.h),
                  const TitleTextField(title: password),
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
                  Gap(20.h),
                  CustomButtonApp(
                    text: signUp,
                    colorText: AppColors.whiteColor,
                    onPressed: () {
                      viewModel.register();
                    },
                    backgroundColor: AppColors.primaryColor,
                  ),
                  Gap(20.h),
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

  Widget _selectedImageSectionWidget() {
    return Stack(
      children: [
        viewModel.image != null
            ? CircleAvatar(
                radius: 64.r,
                backgroundImage: FileImage(viewModel.image!),
                backgroundColor: Colors.transparent,
              )
            : CircleAvatar(
                radius: 64.r,
                backgroundImage: const NetworkImage(
                  "https://cvhrma.org/wp-content/uploads/2015/07/default-profile-photo.jpg",
                ),
                backgroundColor: Colors.transparent,
              ),
        Positioned(
          bottom: -10.h,
          left: 80.w,
          child: IconButton(
            onPressed: _selectedImage,
            icon: Icon(
              Icons.add_a_photo,
              size: 28.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  void _selectedImage() async {
    //? creat modal bottom sheet chose image from gallery or camera
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetOptions(
        onPressedCamera: () async {
          File? temp = await ImageFunctions.cameraPicker();
          if (temp != null) {
            viewModel.image = temp;
          }
          setState(() {});
          Navigator.pop(context);
        },
        onPressedGallery: () async {
          File? temp = await ImageFunctions.galleryPicker();
          if (temp != null) {
            viewModel.image = temp;
          }
          setState(() {});
          Navigator.pop(context);
        },
      ),
    );
  }
}
