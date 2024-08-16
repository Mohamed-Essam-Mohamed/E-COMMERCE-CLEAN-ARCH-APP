import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/animation/shimmer_cart_item_image.dart';
import 'package:e_commerce/src/widget/product_details.dart';

import '../../../../domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/cart_view_model_cubit.dart';

class CartItem extends StatefulWidget {
  final ProductsCartsEntity getProduct;
  final void Function()? deleteOnTap;
  final Animation<double> animation;
  const CartItem(
      {super.key,
      required this.getProduct,
      required this.deleteOnTap,
      required this.animation});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int _numberCountCart;
  late CartViewModelCubit bloc;

  @override
  void initState() {
    super.initState();
    _numberCountCart = widget.getProduct.count!;
  }

  @override
  void dispose() async {
    super.dispose();
    await bloc.updateCountCartItem(
      cartId: widget.getProduct.product?.id ?? '',
      count: _numberCountCart.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<CartViewModelCubit>(context, listen: true);
    return SizeTransition(
      sizeFactor: widget.animation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              width: 1.w,
              color: AppColors.grayColor,
            ),
          ),
          width: double.infinity,
          height: 145.h,
          child: Row(
            children: [
              _imageCartWidget(),
              _bodyCartWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyCartWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _titleAndDeleteSectionWidget(),
            _countWidget(context),
            _priceAndButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _priceAndButtonWidget() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'EGP ${widget.getProduct.price! * _numberCountCart}',
              style: AppTextStyle.textStyle18.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(
                  100.r,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      _numberCountCart > 1
                          ? setState(() {
                              _numberCountCart--;
                            })
                          : null;
                    },
                    icon: Icon(
                      Icons.remove_circle_outline_rounded,
                      color: AppColors.whiteColor,
                      size: 28.sp,
                    ),
                  ),
                  Text(
                    '${_numberCountCart.toString()}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      setState(() {
                        _numberCountCart++;
                      });
                    },
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColors.whiteColor,
                      size: 28.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _countWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
      child: Row(
        children: [
          Text(
            'Count: ${_numberCountCart.toString()}',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _titleAndDeleteSectionWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.getProduct.product?.title ?? "",
              style: AppTextStyle.textStyle18.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: widget.deleteOnTap,
            child: Icon(
              Icons.delete_outline,
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageCartWidget() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 145.h,
      width: 130.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          bottomLeft: Radius.circular(15.r),
        ),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: widget.getProduct.product?.imageCover ?? "",
        placeholder: (context, url) => const ShimmerCartItemImage(),
        errorWidget: (context, url, error) =>
            Image.asset("assets/image/item_2.png"),
      ),
    );
  }
}
