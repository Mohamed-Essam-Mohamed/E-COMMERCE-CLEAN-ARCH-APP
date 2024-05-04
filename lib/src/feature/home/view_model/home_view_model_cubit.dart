import 'package:bloc/bloc.dart';
import '../../../domain/entities/home_entites/categoryorbrand_response_entity.dart';
import '../../../domain/usecases/home_usecase/get_all_brand_usecase.dart';
import '../../../domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  GetAllCategoriesUseCases getAllCategoriesUseCases;
  GetAllBrandUsecase getAllBrandsUseCases;
  var searchController = TextEditingController();

  HomeViewModelCubit(
      {required this.getAllCategoriesUseCases,
      required this.getAllBrandsUseCases})
      : super(HomeViewModelInitial());

  List<CategoryOrBrandDataEntity> listCategoryData = [];
  List<CategoryOrBrandDataEntity> listBrandData = [];
  void getAllCategory() async {
    var either = await getAllCategoriesUseCases.invoke();
    return either.fold((l) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      emit(HomeViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      listCategoryData = r.data ?? [];
      emit(HomeViewModelSuccess(categoryResponseEntity: r));
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
      emit(HomeViewModelSuccess(categoryResponseEntity: r));
    });
  }
}
