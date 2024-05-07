import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/constant/string_const_app.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/getallfavorite_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'favorite_view_model_state.dart';

class FavoriteViewModelCubit extends Cubit<FavoriteViewModelState> {
  FavoriteViewModelCubit({required this.getAllFavoriteUsecase})
      : super(FavoriteViewModelInitial());
  TextEditingController searchController = TextEditingController();
  GetAllFavoriteUsecase getAllFavoriteUsecase;
  List<FavoriteDataEntity> favoriteList = [];
  getAllFavorite() async {
    var either = await getAllFavoriteUsecase.invoke();
    either.fold((l) {
      emit(FavoriteViewModelLoading(message: loading));
      emit(FavoriteViewModelErorer(messageError: l.errorMessage));
    }, (r) {
      emit(FavoriteViewModelLoading(message: loading));
      favoriteList = r.data ?? [];
      emit(FavoriteViewModelSuccess(favoriteDataEntity: r.data));
    });
  }
}
