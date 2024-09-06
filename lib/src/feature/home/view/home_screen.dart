// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:e_commerce/src/animation/shimmer_brands.dart';
import 'package:e_commerce/src/animation/shimmer_home_screen.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_brand_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_specific_product.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/all_product_usecase.dart';
import 'package:e_commerce/src/feature/home/view/widget/brand_gridview.dart';
import 'package:e_commerce/src/feature/home/view/widget/catergory_gridview.dart';
import 'package:e_commerce/src/feature/home/view/widget/slider_image.dart';
import 'package:e_commerce/src/feature/product/view_modle/product_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
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
  late ProductViewModelCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ProductViewModelCubit(
      allProductUseCases: injectAllProductUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      getAllBrandsUseCases: injectGetAllBrandsUseCases(),
      getAllCategoriesUseCases: injectGetAllCategoriesUseCases(),
      getProductSpecificUseCase: injectGetProductSpecificUseCases(),
    );

    viewModel
      ..getAllBrand()
      ..getAllCategory();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.close();
    viewModel.searchController.dispose();
    log("dispose home screen");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductViewModelCubit>(
      create: (context) => viewModel,
      child: BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SliderImages(),
                  Gap(24.h),
                  _sectionTitle(onTap: () {}, title: "Categories"),
                  Gap(10.h),
                  state is GetAllCategoryViewModelLoading
                      ? ShimmerHomeScreen()
                      : state is GetAllCategoryViewModelError
                          ? _errorStateWidget(state.errorMessage)
                          : _successStateGetCategoryWidget(),
                  _sectionTitle(onTap: () {}, title: "Brands"),
                  Gap(10.h),
                  state is GetAllCategoryViewModelLoading
                      ? BrandsShimmer()
                      : state is GetAllBrandViewModelError
                          ? _errorStateWidget(state.errorMessage)
                          : _successStateGetBrandWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _successStateGetBrandWidget() {
    return SizedBox(
      height: 100.h,
      child: BrandGridView(
        allBrandsList: viewModel.allBrandList,
      ),
    );
  }

  Widget _successStateGetCategoryWidget() {
    return SizedBox(
      height: 280.h,
      child: CategoryGridView(
        allCategoryList: viewModel.allCategoryList,
      ),
    );
  }

  Widget _errorStateWidget(String? errorMessage) {
    return Center(
      child: Text(
        errorMessage ?? 'wrong',
        style: AppTextStyle.textStyle24.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _sectionTitle({required String title, required Function()? onTap}) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.textStyle20.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Text(
            'See all',
            style: AppTextStyle.textStyle14,
          ),
        )
      ],
    );
  }
}
