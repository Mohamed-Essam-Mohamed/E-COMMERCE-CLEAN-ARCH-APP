import '../../auth/contant_login/login/view/login_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                SharedPreferencesUtils.removeData(key: 'Token');
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.routeName, (route) => false);
              },
              child: Icon(
                Icons.login_outlined,
                size: 50.sp,
                color: AppColors.blackColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
