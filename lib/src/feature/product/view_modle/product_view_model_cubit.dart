import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/add_to_favorite_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/addtofavorite_usecase.dart';
import '../../../domain/entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';
import '../../../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'product_view_model_state.dart';

class ProductViewModelCubit extends Cubit<ProductViewModelState> {
  AllProductUseCase allProductUseCases;
  AddToCartUseCase addToCartUseCase;
  AddFavorteUsecase addFavorteUsecase;

  int numberOfBagsItem = 0;
  bool checkAddProductOrNot = true;

  ProductViewModelCubit({
    required this.allProductUseCases,
    required this.addToCartUseCase,
    required this.addFavorteUsecase,
  }) : super(
          ProductViewModelLoading(),
        );

  TextEditingController searchController = TextEditingController();
  List<ProductDataEntity> listProduct = [];
  List<ProductDataEntity> searchListProduct = [];
  static ProductViewModelCubit getBloc(context) =>
      BlocProvider.of<ProductViewModelCubit>(context);

  void getAllProduct() async {
    var either = await allProductUseCases.invoke();
    either.fold(
      (l) {
        emit(ProductViewModelLoading());
        emit(ProductViewModelError(errorMessage: l.errorMessage));
      },
      (r) {
        emit(ProductViewModelLoading());
        listProduct = r.data ?? [];
        emit(ProductViewModelSuccess(productResponseEntity: r));
      },
    );
  }

  void addToCart({required String productId}) async {
    var either = await addToCartUseCase.invoke(productId: productId);
    either.fold((l) {
      // emit(AddToCartViewModelLoading());
      // emit(AddToCartViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      numberOfBagsItem = r.numOfCartItems!;
      emit(ChangeNumBadgeViewModelSuccess(numberOfBags: numberOfBagsItem));
      // emit(AddToCartViewModelLoading());
      print("add to cart success");
      emit(AddToCartViewModelSuccess(addToCartResponseEntity: r));
    });
  }

  void addToFavorite({required String productId}) async {
    var either = await addFavorteUsecase.invoke(productId: productId);
    either.fold((l) {
      emit(AddToFavoriteViewModelLoading());
      emit(AddToFavoriteViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(AddToFavoriteViewModelSuccess(addToFavoriteResponseEntity: r));
    });
  }

  //! Function Search
  void searchTextInList(String text) {
    searchListProduct = listProduct.where((product) {
      return product.title!.toLowerCase().contains(text.toLowerCase());
    }).toList();
    emit(SearchViewModelSuccess(productDataEntity: searchListProduct));
  }
}
