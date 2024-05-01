import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/data/api/api_manget.dart';
import 'package:e_commerce/src/data/model/response/category_response_dto/categories_response_dto.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/get_all_catergories_usecases.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  GetAllCategoriesUseCases getAllCategoriesUseCases;
  var searchController = TextEditingController();

  HomeViewModelCubit({required this.getAllCategoriesUseCases})
      : super(HomeViewModelInitial());

  List<DataEntity> listData = [];
  void getAllCategory() async {
    var either = await getAllCategoriesUseCases.invoke();
    return either.fold((l) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      emit(HomeViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(HomeViewModelLoading(message: 'Loading...'));
      listData = r.data ?? [];
      emit(HomeViewModelSuccess(categoryResponseEntity: r));
    });
  }
}
