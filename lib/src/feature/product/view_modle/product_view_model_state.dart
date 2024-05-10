part of 'product_view_model_cubit.dart';

@immutable
sealed class ProductViewModelState {}

class ProductViewModelLoading extends ProductViewModelState {}

class ProductViewModelError extends ProductViewModelState {
  String? errorMessage;
  ProductViewModelError({required this.errorMessage});
}

class ProductViewModelSuccess extends ProductViewModelState {
  ProductResponseEntity productResponseEntity;

  ProductViewModelSuccess({required this.productResponseEntity});
}

//? add to cart states

class AddToCartViewModelLoading extends ProductViewModelState {}

class AddToCartViewModelError extends ProductViewModelState {
  String? errorMessage;
  AddToCartViewModelError({required this.errorMessage});
}

class AddToCartViewModelSuccess extends ProductViewModelState {
  AddToCartResponseEntity addToCartResponseEntity;
  AddToCartViewModelSuccess({required this.addToCartResponseEntity});
}

//?  number of badge states

class ChangeNumBadgeViewModelLoading extends ProductViewModelState {}

class ChangeNumBadgeViewModelError extends ProductViewModelState {
  String? errorMessage;
  ChangeNumBadgeViewModelError({required this.errorMessage});
}

class ChangeNumBadgeViewModelSuccess extends ProductViewModelState {
  int? numberOfBags;
  ChangeNumBadgeViewModelSuccess({required this.numberOfBags});
}

// ? add cart to Favorite
class AddToFavoriteViewModelLoading extends ProductViewModelState {}

class AddToFavoriteViewModelError extends ProductViewModelState {
  String? errorMessage;
  AddToFavoriteViewModelError({required this.errorMessage});
}

class AddToFavoriteViewModelSuccess extends ProductViewModelState {
  AddToFavoriteResponseEntity addToFavoriteResponseEntity;
  AddToFavoriteViewModelSuccess({required this.addToFavoriteResponseEntity});
}

//? search states
class SearchViewModelSuccess extends ProductViewModelState {
  List<ProductDataEntity> productDataEntity;

  SearchViewModelSuccess({required this.productDataEntity});
}
