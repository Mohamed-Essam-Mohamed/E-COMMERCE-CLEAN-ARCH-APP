import 'package:bloc/bloc.dart';
import '../../../domain/entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';
import '../../../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant/string_const_app.dart';
import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'product_view_model_state.dart';

class ProductViewModelCubit extends Cubit<ProductViewModelState> {
  AllProductUseCase allProductUseCases;
  AddToCartUseCase addToCartUseCase;
  int numberOfBagesItem = 0;

  ProductViewModelCubit(
      {required this.allProductUseCases, required this.addToCartUseCase})
      : super(
          ProductViewModelInitial(),
        );

  TextEditingController searchController = TextEditingController();
  List<ProductDataEntity> listProduct = [];

  void getAllProduct() async {
    var either = await allProductUseCases.invoke();
    either.fold(
      (l) {
        emit(ProductViewModelLoading(message: loading));
        emit(ProductViewModelError(errorMessage: l.errorMessage));
      },
      (r) {
        emit(ProductViewModelLoading(message: loading));
        listProduct = r.data ?? [];
        emit(ProductViewModelSuccess(productResponseEntity: r));
      },
    );
  }

  void addToCart({required String productId}) async {
    var either = await addToCartUseCase.invoke(productId: productId);
    either.fold((l) {
      emit(AddToCartViewModelLoading(message: loading));
      emit(AddToCartViewModelLoading(message: l.errorMessage));
    }, (r) {
      numberOfBagesItem = r.numOfCartItems ?? 0;
      emit(ChangeNumBadgeViewModelSuccess(numberOfBages: numberOfBagesItem));
      emit(AddToCartViewModelLoading(message: loading));
      emit(AddToCartViewModelSuccess(addToCartResponseEntity: r));
    });
  }
}
