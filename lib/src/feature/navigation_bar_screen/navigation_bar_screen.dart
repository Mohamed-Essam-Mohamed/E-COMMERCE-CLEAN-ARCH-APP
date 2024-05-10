import 'package:e_commerce/src/feature/favorite/view/favorite_screen.dart';
import 'package:e_commerce/src/feature/home/view/home_screen.dart';
import 'package:e_commerce/src/feature/product/view/product_screen.dart';
import 'package:e_commerce/src/feature/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_colors.dart';

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
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icons/iocn-logo.svg',
          height: 22.h,
          width: 66.w,
          fit: BoxFit.contain,
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.r),
          topRight: Radius.circular(22.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
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
  }
}
