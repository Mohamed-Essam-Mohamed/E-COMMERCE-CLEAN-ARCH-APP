import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_specific_product.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/all_product_usecase.dart';
import '../../../domain/entities/home_entites/categoryorbrand_response_entity.dart';
import '../../../domain/usecases/home_usecase/get_all_brand_usecase.dart';
import '../../../domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  GetAllCategoriesUseCases getAllCategoriesUseCases;
  GetAllBrandUseCase getAllBrandsUseCases;
  AllProductUseCase allProductUseCases;
  GetProductSpecificUseCase getProductSpecificUseCase;

  var searchController = TextEditingController();

  HomeViewModelCubit({
    required this.getAllCategoriesUseCases,
    required this.getAllBrandsUseCases,
    required this.allProductUseCases,
    required this.getProductSpecificUseCase,
  }) : super(HomeViewModelInitial());

  List<CategoryOrBrandDataEntity> listCategoryData = [];
  List<CategoryOrBrandDataEntity> listBrandData = [];
  List<ProductDataEntity>? listProduct = [];
  void getAllCategory() async {
    var either = await getAllCategoriesUseCases.invoke();
    return either.fold((l) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      emit(HomeViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      listCategoryData = r.data ?? [];
      emit(HomeViewModelSuccess());
    });
  }

  void getAllBrand() async {
    var either = await getAllBrandsUseCases.invoke();
    return either.fold((l) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      emit(HomeViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      listBrandData = r.data ?? [];
      emit(HomeViewModelSuccess());
    });
  }

  void getSpecificProduct({required String productId}) async {
    var either =
        await getProductSpecificUseCase.invoke(specificProductId: productId);
    return either.fold((l) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      emit(HomeViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      listProduct = r.data ?? [];
      emit(HomeViewModelSuccess());
    });
  }
}
