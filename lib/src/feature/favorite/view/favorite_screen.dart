import 'package:e_commerce/src/animation/shimmer_cart_screen.dart';
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
        if (state is FavoriteViewModelLoading) {
          return const ShimmmerCartScreen();
        } else if (state is FavoriteViewModelErorer) {
          return Center(child: Text(state.messageError ?? 'wrong'));
        } else if (state is FavoriteViewModelSuccess) {
          return Container(
            padding: EdgeInsets.all(16.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                itemCount: viewModel.favoriteList.length,
                itemBuilder: (context, index) {
                  return FavoriteCartItem(
                    favoriteDataEntity: viewModel.favoriteList[index],
                  );
                },
              ),
            ),
          );
        } else {
          return const ShimmmerCartScreen();
        }
      },
    );
  }
}
