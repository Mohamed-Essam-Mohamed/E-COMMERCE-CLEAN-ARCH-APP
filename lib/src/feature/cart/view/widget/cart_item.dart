import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 1.w,
            color: AppColors.grayColor,
          ),
        ),
        width: 398.w,
        height: 145.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.asset("assets/image/image_slider_1.png"),
              // Image.network(getProduct.product?.imageCover ?? "",
              //     fit: BoxFit.fill),
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
                          Text("Nike Air Jordan 1 Mid",
                              // getProduct.product?.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                          InkWell(
                            onTap: () {
                              //logic here
                              // CartViewModel.get(context)
                              //     .deleteItemInCart(getProduct.product?.id ?? "");
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: AppColors.redColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                    //   child: Row(
                    //     children: [
                    //       Text('Count: ${getProduct.count.toString()}',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .titleMedium!
                    //               .copyWith(color: AppColors.blueGreyColor)),
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("EGp 130",
                                // 'EGP ${getProduct.price}',
                                style: AppTextStyle.textStyle18.copyWith(
                                  color: AppColors.primaryColor,
                                )),
                            Container(
                              height: 50.h,
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
                                      // var counter = getProduct.count ?? 0;
                                      // counter--;
                                      // CartViewModel.get(context)
                                      //     .updateCountInCart(
                                      //         getProduct.product?.id ?? '',
                                      //         counter);
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: AppColors.whiteColor,
                                      size: 28.sp,
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    // getProduct.count.toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.whiteColor),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      // var counter = getProduct.count ?? 0;
                                      // counter++;
                                      // CartViewModel.get(context)
                                      //     .updateCountInCart(
                                      //         getProduct.product?.id ?? '',
                                      //         counter);
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
