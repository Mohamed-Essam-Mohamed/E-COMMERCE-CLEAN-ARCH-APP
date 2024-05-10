import 'package:e_commerce/src/domain/usecases/favorite_usecase/getallfavorite_usecase.dart';
import 'package:e_commerce/src/feature/favorite/view/widget/favorite_cart_item.dart';
import 'package:e_commerce/src/feature/favorite/view_model/favorite_view_model_cubit.dart';
import 'package:e_commerce/src/utils/app_colors.dart';
import 'package:e_commerce/src/widget/containerSearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteViewModelCubit viewModel = FavoriteViewModelCubit(
      getAllFavoriteUsecase: injectGetAllFavoriteUsecase());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteViewModelCubit, FavoriteViewModelState>(
      bloc: viewModel..getAllFavorite(),
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              ContainerSearchWidget(
                controller: viewModel.searchController,
                numberOfBags: 0,
                onTap: () {},
              ),
              Gap(15.h),
              state is FavoriteViewModelLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : state is FavoriteViewModelErorer
                      ? Center(child: Text(state.messageError ?? 'wrong'))
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView.builder(
                              itemCount: viewModel.favoriteList.length,
                              itemBuilder: (context, index) {
                                return FavoriteCartItem(
                                  favoriteDataEntity:
                                      viewModel.favoriteList[index],
                                );
                              }),
                        )
            ],
          ),
        );
      },
    );
  }
}
