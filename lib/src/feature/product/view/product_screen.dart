import 'package:e_commerce/src/animation/shimmer_producte_screen.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/addtofavorite_usecase.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/getallfavorite_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_specific_product.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/dailog.dart';
import 'package:e_commerce/src/widget/custom_text_form_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/home_usecase/get_all_brand_usecase.dart';
import '../../../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import '../../../widget/product_details.dart';
import '../../../widget/product_item.dart';
import '../../cart/view/cart_screen.dart';
import '../view_modle/product_view_model_cubit.dart';

class ProductScreen extends StatefulWidget {
  static const String routeName = 'ProductScreen';
  ProductScreen({this.productId, super.key});
  String? productId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductViewModelCubit viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = ProductViewModelCubit(
      getAllCategoriesUseCases: injectGetAllCategoriesUseCases(),
      getAllBrandsUseCases: injectGetAllBrandsUseCases(),
      allProductUseCases: injectAllProductUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      addFavoriteUseCase: injectAddFavoriteUseCase(),
      getProductSpecificUseCase: injectGetProductSpecificUseCases(),
      getAllFavoriteUseCase: injectGetAllFavoriteUseCase(),
    );

    viewModel.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {});
    return Container(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
      child: SingleChildScrollView(
        child: BlocProvider<ProductViewModelCubit>(
          create: (context) => viewModel,
          child: Column(
            children: [
              //? section Search
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                    child: Badge(
                      child: SvgPicture.asset(
                        'assets/icons/icon-shopping-cart.svg',
                        width: 35.w,
                        height: 35.h,
                        fit: BoxFit.cover,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(15.h),
              BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
                builder: (context, state) {
                  if (state is GetAllProductViewModelLoading) {
                    return const ShimmerProductScreen();
                  } else if (state is GetAllProductViewModelError) {
                    return Center(
                      child: Text(state.errorMessage ?? "wrong"),
                    );
                  } else {
                    return GridViewAllProduct(
                      listProduct: viewModel.searchController.text.isNotEmpty
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
    );
  }
}

class GridViewAllProduct extends StatelessWidget {
  final List<ProductDataEntity> listProduct;

  final bool checkAddProductOrNot;
  const GridViewAllProduct({
    super.key,
    required this.listProduct,
    required this.checkAddProductOrNot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.86,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          childAspectRatio: 0.76,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  argsData: listProduct[index],
                ),
              ),
            );
          },
          child: ProductItem(
            idCart: listProduct[index].id ?? '',
            descriptionImage: listProduct[index].title ?? '',
            pathImage: listProduct[index].imageCover ?? '',
            price: listProduct[index].price.toString(),
            rating: listProduct[index].ratingsAverage ?? 0.0,
            product: listProduct[index],
          ),
        ),
        itemCount: listProduct.length,
      ),
    );
  }
}
