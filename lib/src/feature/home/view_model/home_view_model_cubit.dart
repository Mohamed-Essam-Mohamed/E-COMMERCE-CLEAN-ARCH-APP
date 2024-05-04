import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  GetAllCategoriesUseCases getAllCategoriesUseCases;
  var searchController = TextEditingController();

  HomeViewModelCubit({required this.getAllCategoriesUseCases})
      : super(HomeViewModelInitial());

  List<CategoryDataEntity> listCategoryData = [];
  void getAllCategory() async {
    var either = await getAllCategoriesUseCases.invoke();
    return either.fold((l) {
      emit(CategoryViewModelLoading(message: 'Loading...'));
      emit(CatergoryViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(CategoryViewModelLoading(message: 'Loading...'));
      listCategoryData = r.data ?? [];
      emit(CategoryViewModelSuccess(categoryResponseEntity: r));
    });
  }
}
