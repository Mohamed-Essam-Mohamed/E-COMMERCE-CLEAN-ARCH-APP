import 'package:e_commerce/src/constant/box_hive_const.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../constant/string_const_app.dart';
import '../../../domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import '../../../domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import '../../../domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'cart_view_model_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewModelCubit extends Cubit<CartStatesViewModel> {
  GetAllLoggedCartUseCase getAllLoggedCartUseCase;
  DeleteItemCartUseCase deleteItemCartUseCase;
  UpdateCuntCartUseCase updateCuntCartUseCase;
  AddToCartUseCase addToCartUseCase;

  CartState cartState = CartState.noThing;
  FavoriteState favoriteState = FavoriteState.noThing;
  num? totalPrice = 0;

  CartViewModelCubit({
    required this.getAllLoggedCartUseCase,
    required this.deleteItemCartUseCase,
    required this.updateCuntCartUseCase,
    required this.addToCartUseCase,
  }) : super(GetCartInitialStates());

  static CartViewModelCubit get(cotext) =>
      BlocProvider.of<CartViewModelCubit>(cotext);

  List<ProductsCartsEntity> productCartList = [];

  Future<void> getAllCart() async {
    emit(GetCartLoadingStates(loadingMessage: loading));
    var either = await getAllLoggedCartUseCase.invoke();
    either.fold((l) {
      emit(GetCartErrorStates(errors: l.errorMessage));
    }, (r) async {
      productCartList = r.data?.products ?? [];
      totalPrice = r.data?.totalCartPrice ?? 0;
      emit(GetCartSuccessStates());
    });
  }

  Future<void> deleteItemCart({required String cartId}) async {
    emit(DeleteItemCartLoadingStates());
    var either = await deleteItemCartUseCase.invoke(carttId: cartId);
    either.fold((l) {
      emit(DeleteItemCartEerrorStates(errors: l.errorMessage));
    }, (r) {
      totalPrice = r.data?.totalCartPrice ?? 0;
      emit(DeleteItemCartSuccessStates());
    });
  }

  Future<void> updateCountCartItem(
      {required String cartId, required String count}) async {
    emit(UpdateCountInCartLoadingStates(loadingMessage: loading));
    var either =
        await updateCuntCartUseCase.invoke(cartId: cartId, count: count);
    either.fold((l) {
      emit(UpdateCountInCartErrorStates(errors: l.errorMessage));
    }, (r) {
      // emit(GetCartSuccessStates(dataCartEntity: r.data!));
    });
  }

  Future<void> addToCart({required String productId}) async {
    emit(AddToCartViewModelLoading());
    var either = await addToCartUseCase.invoke(productId: productId);
    either.fold((l) {
      emit(AddToCartViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(AddToCartViewModelSuccess());
    });
  }

  List<ProductDataEntity> productCartHiveList = [];
  var poxCart = Hive.box<ProductDataEntity>(cartHive);

  Future<void> getAllCartHive() async {
    emit(GetCartLoadingStates(loadingMessage: loading));
    productCartHiveList = poxCart.values.toList();
    emit(GetCartSuccessStates());
  }

  Future<void> addToCartHive(
      {required String productId, required ProductDataEntity product}) async {
    await poxCart.put(productId, product);
    // getAllCartHive();
  }

  Future<void> deleteItemCartHive({required String productId}) async {
    await poxCart.delete(productId);
    getAllCartHive();
    // getAllCartHive();
  }

  Future<void> processProductCartHive(
      {required String productId, required ProductDataEntity product}) async {
    if (poxCart.keys.contains(productId)) {
      await deleteItemCartHive(productId: productId);
      cartState = CartState.deletedToCart;
      emit(DeleteItemCartSuccessStates());
    } else {
      await addToCartHive(productId: productId, product: product);
      cartState = CartState.addedToCart;
      emit(AddToCartViewModelSuccess());
    }
  }

  List<ProductDataEntity> productFavoriteHiveList = [];
  var poxFavorite = Hive.box<ProductDataEntity>(favoriteHive);
  Future<void> getAllFavoriteHive() async {
    emit(GetCartLoadingStates(loadingMessage: loading));
    productFavoriteHiveList = poxFavorite.values.toList();
    emit(GetCartSuccessStates());
  }

  Future<void> addToFavoriteHive(
      {required String productId, required ProductDataEntity product}) async {
    await poxFavorite.put(productId, product);
    getAllFavoriteHive();
  }

  Future<void> deleteItemFavoriteHive({required String productId}) async {
    await poxFavorite.delete(productId);
    getAllFavoriteHive();
  }

  processProductFavoriteHive(
      {required String productId, required ProductDataEntity product}) async {
    if (poxFavorite.keys.contains(productId)) {
      favoriteState = FavoriteState.deletedToFavorite;
      await deleteItemFavoriteHive(productId: productId);
      emit(DeleteItemCartSuccessStates());
    } else {
      favoriteState = FavoriteState.addedToFavorite;
      await addToFavoriteHive(productId: productId, product: product);
      emit(AddToCartViewModelSuccess());
    }
  }

  Future<void> initDataHiveApp() async {
    await getAllCart();

    if (productCartList.isEmpty && productCartHiveList.isEmpty) {
      return;
    } else if (productCartHiveList.isEmpty && productCartList.isNotEmpty) {
      for (var element in productCartList) {
        await addToCartHive(
          productId: element.product?.id ?? "",
          product: ProductDataEntity(
            id: element.product?.id ?? "",
            title: element.product?.title ?? "",
            sold: 3333,
            images: [],
            description: "",
            price: 100,
            imageCover: element.product?.imageCover ?? "",
            ratingsAverage: 4.0,
          ),
        );
      }
    }
  }
}

enum CartState {
  addedToCart,
  deletedToCart,
  noThing,
}

enum FavoriteState {
  addedToFavorite,
  deletedToFavorite,
  noThing,
}
