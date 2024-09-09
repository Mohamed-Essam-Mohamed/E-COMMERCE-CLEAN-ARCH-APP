import 'dart:developer';

import 'package:e_commerce/src/domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_state.dart';
import 'package:lottie/lottie.dart';

import '../../../animation/shimmer_cart_screen.dart';
import 'widget/cart_item.dart';
import '../view_model/cart_view_model_cubit.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/update_count_cart_usecase.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "CartScreen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartViewModelCubit viewModel;
  final listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    viewModel = CartViewModelCubit(
      getAllLoggedCartUseCase: injectGetAllLoggedCartUseCase(),
      deleteItemCartUseCase: injectDeleteItemCartUseCase(),
      updateCuntCartUseCase: injectUpdateCuntCartUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
    );
    getDataCart();
  }

  void getDataCart() async {
    await viewModel.getAllCart();
    await viewModel.getAllCartHive();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: BlocBuilder<CartViewModelCubit, CartStatesViewModel>(
        bloc: viewModel,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Gap(15.h),
                state is GetCartLoadingStates
                    ? const ShimmerCartScreen()
                    : state is GetCartErrorStates
                        ? Text("Wrong", style: AppTextStyle.textStyle24)
                        : _listCartsWidget(context, viewModel),
                const Spacer(),
                _checkOutWidget(),
                Gap(10.h),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _appBarWidget(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          // Button logic here
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
      ),
      title: Text(
        'Cart',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _checkOutWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                'Total Price',
                style: AppTextStyle.textStyle18.copyWith(
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'EGP ${viewModel.totalPrice.toString()}',
              style: AppTextStyle.textStyle20.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            //?logic here Checkout
          },
          child: Container(
            height: 48.h,
            width: 270.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 12.h,
                bottom: 12.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 83.w),
                    child: Text(
                      'Check out',
                      style: AppTextStyle.textStyle20
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27.w, right: 32.w),
                    child: Icon(Icons.arrow_forward,
                        size: 20.w, color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _listCartsWidget(BuildContext context, CartViewModelCubit viewModel) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.77,
      child: viewModel.productCartList.isEmpty
          ? Lottie.asset("assets/animation/impty_animation_lottie.json")
          : AnimatedList(
              key: listKey,
              itemBuilder: (context, index, animation) => CartItem(
                animation: animation,
                getProduct: viewModel.productCartList[index],
                deleteOnTap: () async {
                  log('remove item $index');
                  removeItemInListAnimation(index);
                  await viewModel.deleteItemCart(
                    cartId: viewModel.productCartList[index].product?.id ?? "",
                  );
                  await viewModel.deleteItemCartHive(
                    productId:
                        viewModel.productCartList[index].product?.id ?? "",
                  );
                },
              ),
              initialItemCount: viewModel.productCartList.length,
            ),
    );
  }

  void removeItemInListAnimation(int index) {
    final removedItem = viewModel.productCartList[index];
    listKey.currentState!.removeItem(
      index,
      (context, animation) => CartItem(
        getProduct: removedItem,
        animation: animation,
        deleteOnTap: () {},
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
