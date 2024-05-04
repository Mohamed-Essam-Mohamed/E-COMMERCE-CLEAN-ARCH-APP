import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/feature/product/view/product_screen.dart';
import 'package:e_commerce/src/feature/favorite/view/favorite_screen.dart';
import 'package:e_commerce/src/feature/home/view/home_screen.dart';
import 'package:e_commerce/src/feature/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarInitial());
  List<Widget> screens = [
    HomeScreen(),
    ProductScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    emit(NavigationBarInitial());
    currentIndex = index;
    emit(NavigationBarChangeIndexState());
  }
}
