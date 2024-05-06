import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/cart_view_model_cubit.dart';

class CartItem extends StatelessWidget {
  final ProductsCartsEntity getProduct;
  const CartItem({super.key, required this.getProduct});
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CartViewModelCubit>(context);
    return Padding(
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
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r)),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/image/image_slider_1.png",
                image: getProduct.product?.imageCover ?? "",
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              getProduct.product?.title ?? "",
                              style: AppTextStyle.textStyle18.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // logic here
                              CartViewModelCubit.get(context).deleteItemCart(
                                  cartId: getProduct.product?.id ?? "");
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: AppColors.redColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                      child: Row(
                        children: [
                          Text(
                            'Count: ${getProduct.count.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'EGP ${getProduct.price}',
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
                                    onPressed: () {
                                      var counter = getProduct.count ?? 0;
                                      counter--;
                                      bloc.upadateCountCartItme(
                                        cartId: getProduct.product?.id ?? '',
                                        count: counter.toString(),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: AppColors.whiteColor,
                                      size: 28.sp,
                                    ),
                                  ),
                                  Text(
                                    ' ${getProduct.count.toString()}',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.whiteColor),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      var counter = getProduct.count ?? 0;
                                      counter++;
                                      bloc.upadateCountCartItme(
                                        cartId: getProduct.product?.id ?? '',
                                        count: counter.toString(),
                                      );
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
