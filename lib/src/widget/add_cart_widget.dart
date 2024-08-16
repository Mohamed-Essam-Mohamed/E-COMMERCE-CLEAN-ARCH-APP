import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import '../feature/cart/view_model/cart_view_model_state.dart';

class AddToCartWidget extends StatefulWidget {
  AddToCartWidget({
    super.key,
    required this.args,
  });
  final ProductDataEntity args;

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  late CartViewModelCubit viewModel;

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
    viewModel.getAllCart();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    if (viewModel.cartState == CartState.deletedToCart) {
      await viewModel.deleteItemCart(
        cartId: widget.args.id.toString(),
      );
    } else if (viewModel.cartState == CartState.addedToCart) {
      await viewModel.addToCart(
        productId: widget.args.id.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool inBoxHive = viewModel.poxCart.keys.contains(widget.args.id.toString());
    return BlocBuilder<CartViewModelCubit, CartStatesViewModel>(
      bloc: viewModel,
      builder: (context, state) {
        return Row(
          children: [
            Column(
              children: [
                Text(
                  "Total price",
                  style: AppTextStyle.textStyle18.copyWith(
                    color: Colors.grey,
                  ),
                ),
                Gap(5.h),
                Text(
                  "EGP ${widget.args.price}",
                  style: AppTextStyle.textStyle18.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            Gap(32.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  viewModel.processProductCartHive(
                    productId: widget.args.id.toString(),
                    product: widget.args,
                  );

                  setState(() {});
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      inBoxHive ? Colors.green : AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add_shopping_cart_outlined,
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      "Add to cart",
                      style: AppTextStyle.textStyle18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
