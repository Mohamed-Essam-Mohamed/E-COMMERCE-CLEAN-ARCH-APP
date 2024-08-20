import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/animation/shimmer_producte_details.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/all_product_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:e_commerce/src/feature/product/view_modle/product_view_model_cubit.dart';
import 'package:e_commerce/src/utils/dailog.dart';
import 'package:e_commerce/src/widget/add_cart_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/product_entites/product_response_entity.dart';
import '../domain/usecases/home_usecase/get_all_brand_usecase.dart';
import '../domain/usecases/home_usecase/get_specific_product.dart';
import '../domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = "ProductDetailsView";
  final ProductDataEntity argsData;

  const ProductDetails({
    super.key,
    required this.argsData,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductViewModelCubit viewModel;
  bool isFavorite = false;
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    viewModel = ProductViewModelCubit(
      getAllCategoriesUseCases: injectGetAllCategoriesUseCases(),
      getAllBrandsUseCases: injectGetAllBrandsUseCases(),
      allProductUseCases: injectAllProductUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      getProductSpecificUseCase: injectGetProductSpecificUseCases(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: BlocBuilder<ProductViewModelCubit, ProductViewModelState>(
          bloc: viewModel,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(product: widget.argsData),
                Gap(10.h),
                _imageSliderWidget(widget.argsData),
                Gap(24.h),
                _titleAndPriceWidget(widget.argsData),
                Gap(16.h),
                _counterQuantityWidget(widget.argsData, state),
                Gap(10.h),
                _brandAndCategoryWidget(widget.argsData),
                Gap(25.h),
                _descriptionWidget(widget.argsData),
                const Spacer(),
                AddToCartWidget(args: widget.argsData),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _brandAndCategoryWidget(ProductDataEntity args) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            "Brand : ${args.brand?.name ?? "DeFacto"}",
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Gap(10.h),
        Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            "Category : ${args.category?.name ?? "Women's Fashion"}",
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Column _descriptionWidget(ProductDataEntity args) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Description",
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(10.h),
        ReadMoreText(
          args.description ?? '',
          trimLines: 3,
          trimMode: TrimMode.Line,
          style: AppTextStyle.textStyle20.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
          trimCollapsedText: ' Show More',
          trimExpandedText: ' Show Less',
          moreStyle: AppTextStyle.textStyle14.copyWith(
            color: AppColors.primaryColor,
          ),
          lessStyle: AppTextStyle.textStyle14.copyWith(
            color: AppColors.redColor,
          ),
        ),
      ],
    );
  }

  Row _counterQuantityWidget(
      ProductDataEntity args, ProductViewModelState state) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          child: Text(
            "Sold : ${args.sold}",
            style: AppTextStyle.textStyle14.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Gap(16.w),
        SvgPicture.asset("assets/icons/icon-start.svg"),
        Gap(4.w),
        Text(
          "${args.ratingsAverage}",
          style: AppTextStyle.textStyle14.copyWith(
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }

  Row _titleAndPriceWidget(ProductDataEntity args) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            args.title ?? '',
            style: AppTextStyle.textStyle18.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Text(
          "EGP ${args.price}",
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }

  Widget _imageSliderWidget(ProductDataEntity args) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: ImageSlideshow(
          initialPage: 0,
          indicatorColor: AppColors.primaryColor,
          indicatorBackgroundColor: AppColors.whiteColor,
          indicatorBottomPadding: 20.h,
          autoPlayInterval: 3000,
          isLoop: true,
          children: args.images!
              .map(
                (url) => Stack(
                  alignment: Alignment.center,
                  children: [
                    //? blur image background
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 4,
                        sigmaY: 4,
                        tileMode: TileMode.decal,
                      ),
                      enabled: true,
                      child: CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (context, url) =>
                            const ShimmerProcucteDetails(),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/image/item_2.png"),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showImageAlert(url),
                      child: CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (context, url) =>
                            const ShimmerProcucteDetails(),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/image/item_2.png"),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  //?fucntion show image sider by AlertDialog
  void _showImageAlert(String image) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          height: 450.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: InteractiveViewer(
            minScale: 0.05,
            maxScale: 5.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key, required this.product});
  final ProductDataEntity product;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
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
    viewModel.getAllFavoriteHive();
  }

  @override
  Widget build(BuildContext context) {
    bool inBoxHive =
        viewModel.poxFavorite.keys.contains(widget.product.id.toString());

    return AppBar(
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: const Text("Product details"),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () async {
            await viewModel.processProductFavoriteHive(
              product: widget.product,
              productId: widget.product.id.toString(),
            );
            viewModel.favoriteState == FavoriteState.addedToFavorite
                ? DialogUtils.showSnackBar(context, 'Added to favorite')
                : null;
            viewModel.favoriteState == FavoriteState.deletedToFavorite
                ? DialogUtils.showSnackBar(context, 'Removed to favorite')
                : null;
            setState(() {});
          },
          icon: Icon(
            Icons.favorite,
            color: inBoxHive ? AppColors.primaryColor : Colors.grey.shade300,
          ),
        ),
      ],
      foregroundColor: AppColors.primaryColor,
      titleTextStyle: AppTextStyle.textStyle20.copyWith(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      ),
    );
    ;
  }
}
