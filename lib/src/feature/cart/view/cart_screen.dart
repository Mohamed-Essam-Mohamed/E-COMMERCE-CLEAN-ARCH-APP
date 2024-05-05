import 'package:e_commerce/src/feature/cart/view/widget/cart_item.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_state.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart-screen';
  CartViewModelCubit viewModel = CartViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartViewModelCubit>(
      create: (context) => viewModel,
      child: BlocBuilder<CartViewModelCubit, CartStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  // Button logic here
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).primaryColor),
              ),
              title: Text(
                'Cart',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Button logic here
                  },
                  icon: SvgPicture.asset("assets/icons/icon-search.svg"),
                ),
                IconButton(
                  onPressed: () {
                    // Button logic here
                  },
                  icon: SvgPicture.asset("assets/icons/icon-shopping-cart.svg"),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CartItem(),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Text('Total Price',
                                style: AppTextStyle.textStyle18.copyWith(
                                  color: AppColors.grayColor,
                                )),
                          ),
                          Text(
                            "EGP 130",
                            // 'EGP ${state.getCartResponseEntity.data?.totalCartPrice ?? 0}',
                            style: AppTextStyle.textStyle20.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          //logic here
                        },
                        child: Container(
                          height: 48.h,
                          width: 270.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Theme.of(context).primaryColor),
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 83.w),
                                  child: Text('Check out',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 27.w, right: 32.w),
                                  child: Icon(Icons.arrow_forward,
                                      size: 20.w, color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
