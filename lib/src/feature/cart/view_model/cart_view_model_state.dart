import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';

import '../../../domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';

abstract class CartStatesViewModel {}

class GetCartInitialStates extends CartStatesViewModel {}

//? Get all cart
class GetCartLoadingStates extends CartStatesViewModel {
  String? loadingMessage;

  GetCartLoadingStates({required this.loadingMessage});
}

class GetCartErrorStates extends CartStatesViewModel {
  String? errors;

  GetCartErrorStates({required this.errors});
}

class GetCartSuccessStates extends CartStatesViewModel {}

//? Update Count In Cart
class UpdateCountInCartLoadingStates extends CartStatesViewModel {
  String? loadingMessage;

  UpdateCountInCartLoadingStates({required this.loadingMessage});
}

class UpdateCountInCartErrorStates extends CartStatesViewModel {
  String? errors;

  UpdateCountInCartErrorStates({required this.errors});
}

class UpdateCountInSuccessStates extends CartStatesViewModel {
  DataCartEntity dataCartEntity;

  UpdateCountInSuccessStates({required this.dataCartEntity});
}

//? delete item cart
class DeleteItemCartLoadingStates extends CartStatesViewModel {}

class DeleteItemCartEerrorStates extends CartStatesViewModel {
  String? errors;
  DeleteItemCartEerrorStates({required this.errors});
}

class DeleteItemCartSuccessStates extends CartStatesViewModel {}

//? Add To Cart
class AddToCartViewModelLoading extends CartStatesViewModel {}

class AddToCartViewModelError extends CartStatesViewModel {
  String? errorMessage;

  AddToCartViewModelError({required this.errorMessage});
}

class AddToCartViewModelSuccess extends CartStatesViewModel {}
