// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_typing_uninitialized_variables, camel_case_types, prefer_if_null_operators

import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

// GlobalKey<FormState> fromState = GlobalKey();
//   var nameController = TextEditingController();
//   var passwordController = TextEditingController();
//   var confirmationPasswordController = TextEditingController();
//   var phoneController = TextEditingController();
class CustomTextFormApp extends StatefulWidget {
  String hintText;
  bool? isObscureText;
  bool? showObscureText = false;
  String? Function(String?)? validator;
  bool isPhone;
  bool isSearch;
  TextEditingController? controller;
  EdgeInsetsGeometry? contentPadding;
  var keyboardtype;

  CustomTextFormApp({
    this.isObscureText = false,
    required this.hintText,
    this.showObscureText,
    required this.validator,
    this.keyboardtype = TextInputType.name,
    this.isPhone = false,
    this.isSearch = false,
    this.contentPadding,
    required this.controller,
  });

  @override
  State<CustomTextFormApp> createState() => _CustomTextFormAppState();
}

class _CustomTextFormAppState extends State<CustomTextFormApp> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscureText!,
      validator: widget.validator,
      keyboardType: widget.keyboardtype,
      controller: widget.controller,
      style: TextStyle(
        fontSize: 20.sp,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        contentPadding: widget.contentPadding == null
            ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h)
            : widget.contentPadding,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.textStyle18.copyWith(
          color: Color.fromARGB(255, 87, 87, 87),
          fontWeight: FontWeight.w400,
        ),
        errorStyle: AppTextStyle.textStyle13.copyWith(
          color: AppColors.redColor,
          fontWeight: FontWeight.w500,
        ),
        errorMaxLines: 1,
        suffixIcon: widget.showObscureText == true ? logicIcon() : null,
        prefixIcon: widget.isPhone
            ? ContainerFlagWidget()
            : widget.isSearch
                ? IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/icon-search.svg',
                      width: 26.w,
                      height: 26.h,
                      fit: BoxFit.contain,
                    ),
                  )
                : null,
        enabledBorder: customOutLineInputBorder(color: AppColors.blackColor),
        errorBorder: customOutLineInputBorder(color: AppColors.redColor),
        focusedBorder: customOutLineInputBorder(color: AppColors.blueColor),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        color: color,
        width: 1.5.w,
      ),
    );
  }

  Widget logicIcon() {
    return InkWell(
      onTap: () {
        if (widget.isObscureText!) {
          widget.isObscureText = false;
        } else {
          widget.isObscureText = true;
        }
        setState(() {});
      },
      child: widget.isObscureText == false
          ? Icon(
              Icons.visibility,
              size: 23.sp,
            )
          : Icon(
              Icons.visibility_off,
              size: 23.sp,
            ),
    );
  }
}

class ContainerFlagWidget extends StatelessWidget {
  const ContainerFlagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 85.w,
      height: 25,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          children: [
            Image.asset(
              'assets/image/Egypt.png',
              width: 25.w,
              height: 25.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              '+20',
              style: TextStyle(fontSize: 20.sp),
            )
          ],
        ),
      ),
    );
  }
}
