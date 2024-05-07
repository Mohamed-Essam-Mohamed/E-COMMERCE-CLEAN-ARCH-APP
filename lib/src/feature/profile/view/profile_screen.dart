import '../../auth/contant_login/forget_password/view/forget_password_screen.dart';
import '../../auth/contant_login/login/view/login_screen.dart';
import '../../auth/register/view/register_screen.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/shared_preference_utils.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/dailog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                Text(
                  "Account",
                  style: AppTextStyle.textStyle20.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(16.h),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 32,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      Gap(16.h),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          "Login",
                          style: AppTextStyle.textStyle18
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                      Text(
                        " / ",
                        style: AppTextStyle.textStyle18
                            .copyWith(color: Colors.blue),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName);
                        },
                        child: Text(
                          "Register",
                          style: AppTextStyle.textStyle18
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(32),
                Text(
                  "Settings",
                  style: AppTextStyle.textStyle24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(32),
                // _buildListTile('Appearance', Icons.dark_mode, _.theme.toCapitalized(), Colors.purple, theme, onTab: () => _showAppearanceModal(theme, _.theme));
                _buildListTile(
                  'Change Password',
                  Icons.security,
                  '',
                  Colors.orange,
                  onTab: () {
                    Navigator.of(context)
                        .pushNamed(ForGetPasswordScreen.routeName);
                  },
                ),
                Gap(25),
                _buildListTile(
                  'Notifications',
                  Icons.notifications_outlined,
                  '',
                  Colors.blue,
                  onTab: () {},
                ),
                Gap(25),
                _buildListTile(
                  'Help',
                  Icons.help,
                  '',
                  Colors.green,
                  onTab: () {},
                ),
                Gap(25),
                _buildListTile(
                  'Logout',
                  Icons.exit_to_app,
                  '',
                  Colors.red,
                  onTab: () {
                    var user = SharedPreferencesUtils.getData(key: 'Token');
                    if (user == null) {
                      DialogUtils.showMessage(
                        context: context,
                        message: 'Dont have account',
                      );
                    } else {
                      SharedPreferencesUtils.removeData(key: 'Token');
                      Navigator.of(context).pushReplacementNamed(
                        LoginScreen.routeName,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Text(
            "Version 1.0.0",
            style: AppTextStyle.textStyle18.copyWith(
              color: Colors.grey,
            ),
          ),
          Gap(7.h),
        ],
      ),
    );
  }

  Widget _buildListTile(
      String title, IconData icon, String trailing, Color color,
      {onTab}) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        width: 46.w,
        height: 46.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withAlpha(30),
        ),
        child: Center(
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.textStyle18.copyWith(
          color: AppColors.blackColor,
        ),
      ),
      trailing: Container(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              trailing,
              style: AppTextStyle.textStyle18.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
      onTap: onTab,
    );
  }
}
