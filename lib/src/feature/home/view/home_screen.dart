// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_brand_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:e_commerce/src/feature/home/view/widget/brand_gridview.dart';
import 'package:e_commerce/src/feature/home/view/widget/catergory_gridview.dart';
import 'package:e_commerce/src/feature/home/view/widget/container_title.dart';
import 'package:e_commerce/src/feature/home/view/widget/slider_image.dart';
import 'package:e_commerce/src/feature/home/view_model/home_view_model_cubit.dart';
import 'package:e_commerce/src/feature/product/view_modle/product_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:e_commerce/src/widget/custom_text_form_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  HomeViewModelCubit viewModel = HomeViewModelCubit(
    getAllCategoriesUseCases: injectGetAllCategoriesUseCases(),
    getAllBrandsUseCases: injectGetAllBrandsUseCases(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
      bloc: viewModel
        ..getAllCategory()
        ..getAllBrand(),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ContainerSearchWidget(
                  controller: viewModel.searchController,
                  numberOfBages: 1,
                  onTap: () {},
                ),
                Gap(10.h),
                SliderImages(),
                Gap(24.h),
                ContainerTitle(onTap: () {}, title: "Categories"),
                Gap(10.h),
                state is HomeViewModelLoading
                    ? Center(child: CircularProgressIndicator())
                    : state is HomeViewModelError
                        ? Center(
                            child: Text(
                            state.errorMessage ?? 'wrong',
                            style: AppTextStyle.textStyle24.copyWith(
                              color: Colors.black,
                            ),
                          ))
                        : SizedBox(
                            height: 320.h,
                            child: CatergoryGridView(
                              catergoryList: viewModel.listCategoryData,
                            ),
                          ),
                ContainerTitle(onTap: () {}, title: "Brands"),
                Gap(10.h),
                state is HomeViewModelLoading
                    ? Center(child: CircularProgressIndicator())
                    : state is HomeViewModelError
                        ? Center(
                            child: Text(
                            state.errorMessage ?? 'wrong',
                            style: AppTextStyle.textStyle24.copyWith(
                              color: Colors.black,
                            ),
                          ))
                        : SizedBox(
                            height: 320.h,
                            child: BrandGridView(
                              brandList: viewModel.listBrandData,
                            ),
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ContainerSearchWidget extends StatelessWidget {
  const ContainerSearchWidget({
    super.key,
    required this.controller,
    required this.numberOfBages,
    required this.onTap,
  });

  final TextEditingController controller;
  final int numberOfBages;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<ProductViewModelCubit>(context);
    return Row(
      children: [
        Expanded(
          child: CustomTextFormApp(
            hintText: 'what do you search for?',
            isSearch: true,
            validator: (text) {},
            controller: controller,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 8.h,
            ),
          ),
        ),
        Gap(7.w),
        InkWell(
          onTap: onTap,
          child: Badge(
            label: Text('$numberOfBages'),
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/icons/icon-shopping-cart.svg',
              width: 35.w,
              height: 35.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
