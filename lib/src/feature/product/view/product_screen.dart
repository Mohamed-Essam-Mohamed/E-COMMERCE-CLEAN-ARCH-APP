import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import '../../home/view/home_screen.dart';
import '../../../widget/product_details_view.dart';
import '../../../widget/product_item.dart';
import '../view_modle/product_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final ProductViewModelCubit viewModel =
      ProductViewModelCubit(allProductUseCases: injectAllProductUseCase());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: SingleChildScrollView(
        child: BlocConsumer<ProductViewModelCubit, ProductViewModelState>(
          bloc: viewModel..getAllProduct(),
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                ContainerSearchWidget(controller: viewModel.searchController),
                Gap(15.h),
                state is ProductViewModelLoading
                    ? Center(child: CircularProgressIndicator())
                    : state is ProductViewModelError
                        ? Center(child: Text(state.errorMessage ?? 'wrong'))
                        : GridViewAllProduct(
                            listProduct: viewModel.listProduct ?? [],
                          ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class GridViewAllProduct extends StatelessWidget {
  final List<ProductDataEntity> listProduct;
  const GridViewAllProduct({
    super.key,
    required this.listProduct,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (context, index) => InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsView.routeName,
              arguments: listProduct[index],
            );
          },
          child: ProductItem(
            onTapAddCard: () {},
            onTapLove: () {},
            descriptionImage: listProduct[index].description ?? '',
            pathImage: listProduct[index].imageCover ?? '',
            price: listProduct[index].price.toString(),
          ),
        ),
        itemCount: listProduct.length,
      ),
    );
  }
}