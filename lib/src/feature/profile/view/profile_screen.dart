import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:gap/gap.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                Text(
                  "Account",
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
                      Text(
                        "Login / Register",
                        style: AppTextStyle.textStyle18
                            .copyWith(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Gap(32),
                Text(
                  "Settings",
                ),
                Gap(32),
                // _buildListTile('Appearance', Icons.dark_mode, _.theme.toCapitalized(), Colors.purple, theme, onTab: () => _showAppearanceModal(theme, _.theme));
                _buildListTile(
                  'Language',
                  Icons.language,
                  'English',
                  Colors.orange,
                  onTab: () {},
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
                  onTab: () {},
                ),
              ],
            ),
          ),
          Text(
            "Version 1.0.0",
          ),
          Gap(7),
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
