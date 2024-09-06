// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_state.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../animation/shimmer_producte_item_image.dart';

class ProductItem extends StatefulWidget {
  final String pathImage;
  final String descriptionImage;
  final String price;
  final num? rating;
  final String idCart;
  ProductDataEntity product;

  ProductItem({
    Key? key,
    required this.pathImage,
    required this.descriptionImage,
    required this.price,
    required this.rating,
    required this.idCart,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageSectionWidget(),
          const Spacer(),
          _titleProductItemWidget(),
          const Spacer(),
          _priceSectionWidget(),
          const Spacer(),
          _reviewSectionWidget(),
          const Spacer(),
          Gap(2.h),
        ],
      ),
    );
  }

  Widget _reviewSectionWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Row(
        children: [
          Text(
            "Review (${widget.rating})",
            style: const TextStyle(
              color: Color(0xff06004F),
            ),
          ),
          const Icon(Icons.star, color: Colors.yellow, size: 20),
          const Spacer(),
          ButtonAddedToCartWidget(
            product: widget.product,
          ),
        ],
      ),
    );
  }

  Widget _priceSectionWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Text.rich(
        TextSpan(
          text: 'EGP ',
          style: AppTextStyle.textStyle14.copyWith(
            fontSize: 14.sp,
            color: const Color(0xff06004F),
          ),
          children: <TextSpan>[
            TextSpan(
              text: "${widget.price}   ",
            ),
            TextSpan(
              text: " ${double.parse(widget.price) + 30.00} EGP",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.blueColor.withAlpha(100),
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.blueColor,
                decorationStyle: TextDecorationStyle.solid,
                overflow: TextOverflow.ellipsis,
                decorationThickness: 1,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleProductItemWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 5.h,
      ),
      child: Text(
        widget.descriptionImage,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.textStyle18.copyWith(
          color: AppColors.primaryColor,
          height: 0,
        ),
      ),
    );
  }

  Widget _imageSectionWidget() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: CachedNetworkImage(
              imageUrl: widget.pathImage,
              placeholder: (context, url) => const ShimmerProductItemImage(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline, color: Colors.red),
              width: double.infinity,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
          child: CachedNetworkImage(
            imageUrl: widget.pathImage,
            placeholder: (context, url) => const ShimmerProductItemImage(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline, color: Colors.red),
            width: double.infinity,
            height: 150.h,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class ButtonAddedToCartWidget extends StatefulWidget {
  const ButtonAddedToCartWidget({
    super.key,
    required this.product,
  });
  final ProductDataEntity product;

  @override
  State<ButtonAddedToCartWidget> createState() =>
      _ButtonAddedToCartWidgetState();
}

class _ButtonAddedToCartWidgetState extends State<ButtonAddedToCartWidget> {
  late CartViewModelCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CartViewModelCubit(
      getAllLoggedCartUseCase: injectGetAllLoggedCartUseCase(),
      deleteItemCartUseCase: injectDeleteItemCartUseCase(),
      updateCuntCartUseCase: injectUpdateCuntCartUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
    );
    viewModel.getAllCartHive();
  }

  @override
  void dispose() async {
    super.dispose();
    if (viewModel.cartState == CartState.deletedToCart) {
      await viewModel.deleteItemCart(
        cartId: widget.product.id.toString(),
      );
    } else if (viewModel.cartState == CartState.addedToCart) {
      await viewModel.addToCart(
        productId: widget.product.id.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool inBoxHive =
        viewModel.poxCart.keys.contains(widget.product.id.toString());
    return BlocBuilder<CartViewModelCubit, CartStatesViewModel>(
      bloc: viewModel,
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            viewModel.processProductCartHive(
              productId: widget.product.id.toString(),
              product: widget.product,
            );
            setState(() {});
          },
          child: SvgPicture.asset(
            'assets/icons/icon-add.svg',
            height: 30,
            width: 30,
            fit: BoxFit.cover,
            color: inBoxHive ? Colors.green.shade300 : AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
