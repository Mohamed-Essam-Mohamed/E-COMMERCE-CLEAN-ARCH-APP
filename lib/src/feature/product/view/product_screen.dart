import 'package:e_commerce/src/animation/shimmer_producte_screen.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/addtofavorite_usecase.dart';
import 'package:e_commerce/src/utils/dailog.dart';
import 'package:e_commerce/src/utils/shared_preference_utils.dart';
import 'package:e_commerce/src/widget/custom_text_form_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import '../../../widget/product_details_view.dart';
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
  ProductViewModelCubit viewModel = ProductViewModelCubit(
    allProductUseCases: injectAllProductUseCase(),
    addToCartUseCase: injectAddToCartUseCase(),
    addFavorteUsecase: injectAddFavorteUsecase(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 25.h),
      child: SingleChildScrollView(
        child: BlocProvider<ProductViewModelCubit>(
          create: (context) => viewModel..getAllProduct(),
          child: Column(
            children: [
              //? search appBar

              BlocSelector<ProductViewModelCubit, ProductViewModelState, int>(
                selector: (state) {
                  return viewModel.numberOfBagsItem;
                },
                builder: (context, state) {
                  return Row(
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
                          label: Text(viewModel.numberOfBagsItem.toString()),
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
                },
              ),

              Gap(15.h),
              BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
                builder: (context, state) {
                  if (state is ProductViewModelLoading) {
                    return const ShimmerProductScreen();
                  } else if (state is ProductViewModelError) {
                    return Center(
                      child: Text(state.errorMessage ?? "wrong"),
                    );
                  } else {
                    return GridViewAllProduct(
                      listProduct: viewModel.searchController.text.isNotEmpty
                          ? viewModel.searchListProduct
                          : viewModel.listProduct,
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
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (context, index) => InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsView.routeName,
              arguments: listProduct[index],
            );
          },
          child: ProductItem(
            onTapAddCard: () {
              if (checkAddProductOrNot) {
                ProductViewModelCubit.getBloc(context)
                    .addToCart(productId: listProduct[index].id ?? '');
                DialogUtils.showSnackBar(context, 'Added to cart');
              }
            },
            onTapLove: () {
              ProductViewModelCubit.getBloc(context)
                  .addToFavorite(productId: listProduct[index].id ?? '');
              DialogUtils.showSnackBar(context, 'Added to favorite');
            },
            descriptionImage: listProduct[index].title ?? '',
            pathImage: listProduct[index].imageCover ?? '',
            price: listProduct[index].price.toString(),
          ),
        ),
        itemCount: listProduct.length,
      ),
    );
  }
}
