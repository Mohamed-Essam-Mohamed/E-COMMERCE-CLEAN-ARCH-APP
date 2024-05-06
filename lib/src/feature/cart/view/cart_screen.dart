import 'widget/cart_item.dart';
import '../view_model/cart_view_model_cubit.dart';
import '../view_model/cart_view_model_state.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  CartViewModelCubit viewModel = CartViewModelCubit(
    getAllLoggedCartUseCase: injectGetAllLoggedCartUseCase(),
    deleteItemCartUseCase: injectDeleteItemCartUseCase(),
    updateCuntCartUsecase: injectUpdateCuntCartUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartViewModelCubit>(
      create: (context) => viewModel..getAllCart(),
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
              child: state is GetCartLoadingStates
                  ? Center(child: CircularProgressIndicator())
                  : state is GetCartErrorStates
                      ? Center(
                          child: Text(state.errors ?? 'wrong'),
                        )
                      : state is GetCartSuccessStates
                          ? Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.77,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) => CartItem(
                                      getProduct:
                                          state.dataCartEntity.products![index],
                                    ),
                                    itemCount:
                                        state.dataCartEntity.products?.length,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 12.h),
                                          child: Text(
                                            'Total Price',
                                            style: AppTextStyle.textStyle18
                                                .copyWith(
                                              color: AppColors.grayColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'EGP ${state.dataCartEntity.totalCartPrice}',
                                          style:
                                              AppTextStyle.textStyle20.copyWith(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w500,
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
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: AppColors.primaryColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 12.h,
                                            bottom: 12.h,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 83.w),
                                                child: Text(
                                                  'Check out',
                                                  style: AppTextStyle
                                                      .textStyle20
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 27.w, right: 32.w),
                                                child: Icon(Icons.arrow_forward,
                                                    size: 20.w,
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Gap(20.h),
                              ],
                            )
                          : SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
