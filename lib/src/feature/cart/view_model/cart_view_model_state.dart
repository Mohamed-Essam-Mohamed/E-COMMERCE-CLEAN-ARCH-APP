abstract class CartStates {}

class GetCartInitialStates extends CartStates {}

class GetCartLoadingStates extends CartStates {
  String? loadingMessage;

  GetCartLoadingStates({required this.loadingMessage});
}

class GetCartErrorStates extends CartStates {
  String errors;

  GetCartErrorStates({required this.errors});
}

class GetCartSuccessStates extends CartStates {
  // GetCartResponseEntity getCartResponseEntity;

  // GetCartSuccessStates({required this.getCartResponseEntity});
}

class DeleteItemInCartLoadingStates extends CartStates {
  String? loadingMessage;

  DeleteItemInCartLoadingStates({required this.loadingMessage});
}

class DeleteItemInCartErrorStates extends CartStates {
  // Failures errors;

  // DeleteItemInCartErrorStates({required this.errors});
}

class DeleteItemInSuccessStates extends CartStates {
  // GetCartResponseEntity getCartResponseEntity;

  // DeleteItemInSuccessStates({required this.getCartResponseEntity});
}

class UpdateCountInCartLoadingStates extends CartStates {
  String? loadingMessage;

  UpdateCountInCartLoadingStates({required this.loadingMessage});
}

class UpdateCountInCartErrorStates extends CartStates {
  // Failures errors;

  // UpdateCountInCartErrorStates({required this.errors});
}

class UpdateCountInSuccessStates extends CartStates {
  // GetCartResponseEntity getCartResponseEntity;

  // UpdateCountInSuccessStates({required this.getCartResponseEntity});
}
