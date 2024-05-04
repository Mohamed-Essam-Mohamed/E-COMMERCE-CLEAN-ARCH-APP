import 'package:bloc/bloc.dart';
import '../../../constant/string_const_app.dart';
import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'product_view_model_state.dart';

class ProductViewModelCubit extends Cubit<ProductViewModelState> {
  ProductViewModelCubit({required this.allProductUseCases})
      : super(ProductViewModelInitial());
  TextEditingController searchController = TextEditingController();
  AllProductUseCase allProductUseCases;
  List<ProductDataEntity> listProduct = [];
  void getAllProduct() async {
    var either = await allProductUseCases.invoke();
    either.fold((l) {
      emit(ProductViewModelLoading(message: loading));
      emit(ProductViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(ProductViewModelLoading(message: loading));
      listProduct = r.data ?? [];
      emit(ProductViewModelSuccess(productResponseEntity: r));
    });
  }
}
