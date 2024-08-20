import 'package:e_commerce/src/domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:e_commerce/src/feature/favorite/widget/favorite_cart_item.dart';
import 'package:e_commerce/src/utils/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../domain/usecases/product_usecase/add_to_cart_usecase.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late CartViewModelCubit viewModel;
  final listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = CartViewModelCubit(
      getAllLoggedCartUseCase: injectGetAllLoggedCartUseCase(),
      deleteItemCartUseCase: injectDeleteItemCartUseCase(),
      updateCuntCartUseCase: injectUpdateCuntCartUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel..getAllFavoriteHive(),
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.h),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: viewModel.productFavoriteHiveList.isEmpty
                ? Lottie.asset("assets/animation/impty_animation_lottie.json")
                : AnimatedList(
                    key: listKey,
                    itemBuilder: (context, index, animation) =>
                        FavoriteCartItem(
                      animation: animation,
                      favoriteDataEntity:
                          viewModel.productFavoriteHiveList[index],
                      onPressed: () async {
                        removeItemInListAnimation(index);
                        await viewModel.processProductFavoriteHive(
                          product: viewModel.productFavoriteHiveList[index],
                          productId: viewModel.productFavoriteHiveList[index].id
                              .toString(),
                        );
                        viewModel.favoriteState == FavoriteState.addedToFavorite
                            ? DialogUtils.showSnackBar(
                                context, 'Added to favorite')
                            : null;
                        viewModel.favoriteState ==
                                FavoriteState.deletedToFavorite
                            ? DialogUtils.showSnackBar(
                                context, 'Removed to favorite')
                            : null;
                      },
                    ),
                    initialItemCount: viewModel.productFavoriteHiveList.length,
                  ),
          ),
        );
      },
    );
  }

  void removeItemInListAnimation(int index) {
    final removedItem = viewModel.productFavoriteHiveList[index];
    viewModel.productFavoriteHiveList.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => FavoriteCartItem(
        onPressed: () {},
        animation: animation,
        favoriteDataEntity: removedItem,
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
