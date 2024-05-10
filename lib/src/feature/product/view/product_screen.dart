import 'package:e_commerce/src/animation/shimmer_producte_screen.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/addtofavorite_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import '../../../widget/containerSearchWidget.dart';
import '../../../widget/product_details_view.dart';
import '../../../widget/product_item.dart';
import '../../cart/view/cart_screen.dart';
import '../view_modle/product_view_model_cubit.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

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
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: SingleChildScrollView(
        child: BlocProvider<ProductViewModelCubit>(
          create: (context) => viewModel..getAllProduct(),
          child: Column(
            children: [
              ContainerSearchWidget(
                controller: viewModel.searchController,
                numberOfBages: viewModel.numberOfBagsItem,
                onTap: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
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
                  } else if (state is ProductViewModelSuccess) {
                    return GridViewAllProduct(
                      listProduct: viewModel.listProduct,
                    );
                  }
                  return Container();
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
  const GridViewAllProduct({
    super.key,
    required this.listProduct,
  });

  @override
  Widget build(BuildContext context) {
    bool isLove = false;

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
              ProductViewModelCubit.getBloc(context)
                  .addToCart(productId: listProduct[index].id ?? '');
            },
            onTapLove: () {
              ProductViewModelCubit.getBloc(context)
                  .addToFavorite(productId: listProduct[index].id ?? '');
            },
            descriptionImage: listProduct[index].description ?? '',
            pathImage: listProduct[index].imageCover ?? '',
            price: listProduct[index].price.toString(),
          ),
        ),
        itemCount: listProduct.length,
      ),
    );
  }
}
