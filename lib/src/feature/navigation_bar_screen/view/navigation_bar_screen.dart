import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_colors.dart';
import '../view_model/navigation_bar_cubit.dart';

class NavigationBarScreen extends StatelessWidget {
  static const String routeName = "NavigationBarScreen";
  NavigationBarScreen({super.key});

  NavigationBarCubit viewModel = NavigationBarCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(
              'assets/icons/iocn-logo.svg',
              height: 22.h,
              width: 66.w,
              fit: BoxFit.contain,
            ),
          ),
          body: viewModel.screens[viewModel.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.r),
              topRight: Radius.circular(22.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.primaryColor,
              enableFeedback: false,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 10,
              onTap: (index) {
                viewModel.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/icon-home-unselected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-home-selected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/icon-category-unselected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-category-selected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/icon-love-unselected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-love-selected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/icon-profile-unselected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/icon-profile-selected.svg',
                    height: 34.h,
                    width: 36.w,
                    fit: BoxFit.cover,
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
