// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/src/animation/shimmer_home_screen.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_brand_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:e_commerce/src/feature/home/view/widget/brand_gridview.dart';
import 'package:e_commerce/src/feature/home/view/widget/catergory_gridview.dart';
import 'package:e_commerce/src/feature/home/view/widget/container_title.dart';
import 'package:e_commerce/src/feature/home/view/widget/slider_image.dart';
import 'package:e_commerce/src/feature/home/view_model/home_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/widget/containerSearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModelCubit viewModel = HomeViewModelCubit(
    getAllCategoriesUseCases: injectGetAllCategoriesUseCases(),
    getAllBrandsUseCases: injectGetAllBrandsUseCases(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
      bloc: viewModel
        ..getAllCategory()
        ..getAllBrand(),
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ContainerSearchWidget(
                  controller: viewModel.searchController,
                  numberOfBags: 0,
                  onTap: () {},
                ),
                Gap(10.h),
                SliderImages(),
                Gap(24.h),
                ContainerTitle(onTap: () {}, title: "Categories"),
                Gap(10.h),
                state is HomeViewModelError
                    ? Center(
                        child: Text(
                          state.errorMessage ?? 'wrong',
                          style: AppTextStyle.textStyle24.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      )
                    : state is HomeViewModelSuccess
                        ? SizedBox(
                            height: 320.h,
                            child: CatergoryGridView(
                              catergoryList: viewModel.listCategoryData,
                            ),
                          )
                        : ShimmerHomeScreen(),
                ContainerTitle(onTap: () {}, title: "Brands"),
                Gap(10.h),
                state is HomeViewModelError
                    ? Center(
                        child: Text(
                          state.errorMessage ?? 'wrong',
                          style: AppTextStyle.textStyle24.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      )
                    : state is HomeViewModelSuccess
                        ? SizedBox(
                            height: 320.h,
                            child: BrandGridView(
                              brandList: viewModel.listBrandData,
                            ),
                          )
                        : ShimmerHomeScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
