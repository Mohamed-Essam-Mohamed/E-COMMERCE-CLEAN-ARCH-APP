import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:e_commerce/src/utils/dailog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../animation/shimmer_cart_item_image.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCartItem extends StatefulWidget {
  final ProductDataEntity favoriteDataEntity;
  final Animation<double> animation;
  final void Function()? onPressed;

  const FavoriteCartItem({
    super.key,
    required this.favoriteDataEntity,
    required this.animation,
    required this.onPressed,
  });

  @override
  State<FavoriteCartItem> createState() => _FavoriteCartItemState();
}

class _FavoriteCartItemState extends State<FavoriteCartItem> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CartViewModelCubit>(context);
    bool inBoxHive = cubit.poxFavorite.keys
        .contains(widget.favoriteDataEntity.id.toString());
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
              Container(
                clipBehavior: Clip.antiAlias,
                height: 145.h,
                width: 130.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r)),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.favoriteDataEntity.imageCover ?? "",
                  placeholder: (context, url) => ShimmerCartItemImage(),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/image/item_2.png"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.favoriteDataEntity.title ?? "",
                                style: AppTextStyle.textStyle18.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: widget.onPressed,
                              icon: Icon(
                                Icons.favorite,
                                color: inBoxHive
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/icon-start.svg"),
                          Gap(4.w),
                          Text(
                            "${widget.favoriteDataEntity.ratingsAverage} ratings",
                            style: AppTextStyle.textStyle14.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'EGP ${widget.favoriteDataEntity.price}',
                                style: AppTextStyle.textStyle18.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Container(
                                height: 80.h,
                                padding: EdgeInsets.all(6.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    100.r,
                                  ),
                                ),
                                child: Text(
                                  "it's your favorite",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor,
                                  ),
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
      ),
    );
  }
}
