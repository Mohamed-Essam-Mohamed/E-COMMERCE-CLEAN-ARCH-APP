import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';

abstract class CartStates {}

class GetCartInitialStates extends CartStates {}

class GetCartLoadingStates extends CartStates {
  String? loadingMessage;

  GetCartLoadingStates({required this.loadingMessage});
}

class GetCartErrorStates extends CartStates {
  String? errors;

  GetCartErrorStates({required this.errors});
}

class GetCartSuccessStates extends CartStates {
  DataCartEntity dataCartEntity;

  GetCartSuccessStates({required this.dataCartEntity});
}

class UpdateCountInCartLoadingStates extends CartStates {
  String? loadingMessage;

  UpdateCountInCartLoadingStates({required this.loadingMessage});
}

class UpdateCountInCartErrorStates extends CartStates {
  String? errors;

  UpdateCountInCartErrorStates({required this.errors});
}

class UpdateCountInSuccessStates extends CartStates {
  DataCartEntity dataCartEntity;

  UpdateCountInSuccessStates({required this.dataCartEntity});
}
