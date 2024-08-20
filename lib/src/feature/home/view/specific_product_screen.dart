import 'package:e_commerce/src/animation/shimmer_producte_screen.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_specific_product.dart';
import 'package:e_commerce/src/feature/product/view/product_screen.dart';
import 'package:e_commerce/src/feature/product/view_modle/product_view_model_cubit.dart';
import 'package:e_commerce/src/widget/custom_text_form_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../domain/usecases/home_usecase/get_all_brand_usecase.dart';
import '../../../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import '../../cart/view/cart_screen.dart';

class SpecificProductScreen extends StatefulWidget {
  static const String routeName = 'SpecificProductScreen';
  SpecificProductScreen({this.productId, super.key});
  String? productId;

  @override
  State<SpecificProductScreen> createState() => _SpecificProductScreenState();
}

class _SpecificProductScreenState extends State<SpecificProductScreen> {
  late ProductViewModelCubit viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = ProductViewModelCubit(
      getAllCategoriesUseCases: injectGetAllCategoriesUseCases(),
      getAllBrandsUseCases: injectGetAllBrandsUseCases(),
      allProductUseCases: injectAllProductUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      getProductSpecificUseCase: injectGetProductSpecificUseCases(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 25.h),
          child: SingleChildScrollView(
            child: BlocProvider<ProductViewModelCubit>(
              create: (context) =>
                  viewModel..getSpecificProduct(productId: args),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormApp(
                          hintText: 'what do you search for?',
                          isSearch: true,
                          validator: (text) {},
                          controller: viewModel.searchController,
                          onChanged: (text) {
                            viewModel.searchTextInList(text);
                          },
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.h,
                            vertical: 8.h,
                          ),
                        ),
                      ),
                      Gap(7.w),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        child: Badge(
                          child: SvgPicture.asset(
                            'assets/icons/icon-shopping-cart.svg',
                            width: 35.w,
                            height: 35.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(15.h),
                  BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
                    bloc: viewModel..getSpecificProduct(productId: args),
                    builder: (context, state) {
                      if (state is GetSpecificProductViewModelLoading) {
                        return const ShimmerProductScreen();
                      } else if (state is GetSpecificProductViewModelError) {
                        return Center(
                          child: Text(state.errorMessage ?? "wrong"),
                        );
                      } else {
                        return GridViewAllProduct(
                          listProduct:
                              viewModel.searchController.text.isNotEmpty
                                  ? viewModel.searchProductList
                                  : viewModel.allProductList,
                          checkAddProductOrNot: viewModel.checkAddProductOrNot,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
