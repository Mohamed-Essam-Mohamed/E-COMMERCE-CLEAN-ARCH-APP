import 'package:e_commerce/src/feature/favorite/view/favorite_screen.dart';
import 'package:e_commerce/src/feature/home/view/home_screen.dart';
import 'package:e_commerce/src/feature/product/view/product_screen.dart';
import 'package:e_commerce/src/feature/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';

class NavigationBarScreen extends StatefulWidget {
  static const String routeName = "NavigationBarScreen";
  NavigationBarScreen({super.key});
  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  List<Widget> screens = [
    HomeScreen(),
    ProductScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        enableFeedback: false,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: (index) {
          changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-shop.svg',
              height: 25.h,
              width: 25.w,
              fit: BoxFit.cover,
              color: AppColors.grayColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-shop.svg',
              height: 25.h,
              width: 25.w,
              fit: BoxFit.fill,
              color: AppColors.primaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-category-unselected.svg',
              height: 34.h,
              width: 36.w,
              fit: BoxFit.cover,
              color: AppColors.grayColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-category-unselected.svg',
              height: 34.h,
              width: 36.w,
              fit: BoxFit.cover,
              color: AppColors.primaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-heart.svg',
              height: 25.h,
              width: 25.w,
              fit: BoxFit.fill,
              color: AppColors.grayColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-heart.svg',
              height: 25.h,
              width: 25.w,
              fit: BoxFit.fill,
              color: AppColors.primaryColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-user.svg',
              height: 25.h,
              width: 25.w,
              color: AppColors.grayColor,
              fit: BoxFit.fill,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-user.svg',
              height: 25.h,
              width: 25.w,
              color: AppColors.primaryColor,
              fit: BoxFit.fill,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
