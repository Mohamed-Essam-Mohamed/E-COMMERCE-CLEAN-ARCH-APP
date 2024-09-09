import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:e_commerce/src/feature/notification/class_basic_notification_package/class_basic_notification_package.dart';
import 'package:e_commerce/src/helper/user_data/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../auth/contant_login/forget_password/view/forget_password_screen.dart';
import '../../auth/contant_login/login/view/login_screen.dart';
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
    var bloc = BlocProvider.of<CartViewModelCubit>(context);
    bool valueSwitch = false;
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
                  style: AppTextStyle.textStyle24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(16.h),
                const InformationUser(),
                Gap(32.h),
                Text(
                  "Settings",
                  style: AppTextStyle.textStyle24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(32.h),
                _buildListTile(
                  'Change Password',
                  Icons.security,
                  '',
                  Colors.orange,
                  onTab: () {
                    DialogUtils.showMessageProfile(
                      context: context,
                      message: "Are you sure you want to change password",
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForGetPasswordScreen.routeName);
                      },
                    );
                  },
                ),
                Gap(25.h),
                _buildListTile(
                  'Notifications',
                  Icons.notifications_outlined,
                  '',
                  Colors.blue,
                  onTab: () {
                    DialogUtils.showMessageProfile(
                      context: context,
                      message: "Are you sure cancel all notification?",
                      onPressed: () async {
                        ClassBasicNotificationPackage.cancelNotification();
                        Navigator.of(context).pop();
                        DialogUtils.showSnackBar(
                          context,
                          'Notification has been canceled',
                        );
                      },
                    );
                  },
                ),
                Gap(25.h),
                _buildListTile(
                  'Help',
                  Icons.help,
                  '',
                  Colors.green,
                  onTab: () {},
                ),
                Gap(25.h),
                _buildListTile(
                  'Logout',
                  Icons.exit_to_app,
                  '',
                  Colors.red,
                  onTab: () {
                    DialogUtils.showMessageProfile(
                      context: context,
                      message: "Are you sure you want to Logout",
                      onPressed: () async {
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

                        await bloc.poxCart.clear();
                        await bloc.poxFavorite.clear();
                      },
                    );
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
    String title,
    IconData icon,
    String trailing,
    Color color, {
    onTab,
  }) {
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
      trailing: SizedBox(
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

class InformationUser extends StatelessWidget {
  const InformationUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SaveUserProvider>(context);
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(52.h),
            child: CachedNetworkImage(
              height: 52.h,
              width: 52.w,
              fit: BoxFit.contain,
              imageUrl: provider.user?.imageUrl ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Container(
                width: 52.w,
                height: 52.h,
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Gap(16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                provider.user?.fullName ?? "",
                style: AppTextStyle.textStyle18.copyWith(color: Colors.blue),
              ),
              Gap(8.h),
              Text(
                provider.user?.email ?? "",
                style: AppTextStyle.textStyle18.copyWith(color: Colors.blue),
              ),
            ],
          )
        ],
      ),
    );
  }
}
