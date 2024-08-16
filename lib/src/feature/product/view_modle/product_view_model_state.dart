part of 'product_view_model_cubit.dart';

@immutable
sealed class ProductViewModelState {}

class ProductViewModelInitial extends ProductViewModelState {}

class GetAllProductViewModelLoading extends ProductViewModelState {}

class GetAllProductViewModelError extends ProductViewModelState {
  final String? errorMessage;
  GetAllProductViewModelError({required this.errorMessage});
}

class GetAllProductViewModelSuccess extends ProductViewModelState {}

//? add to cart states

class AddToCartViewModelLoading extends ProductViewModelState {}

class AddToCartViewModelError extends ProductViewModelState {
  final String? errorMessage;
  AddToCartViewModelError({required this.errorMessage});
}

class AddToCartViewModelSuccess extends ProductViewModelState {}

//?  number of badge states

class ChangeNumBadgeViewModelLoading extends ProductViewModelState {}

class ChangeNumBadgeViewModelError extends ProductViewModelState {
  final String? errorMessage;
  ChangeNumBadgeViewModelError({required this.errorMessage});
}

class ChangeNumBadgeViewModelSuccess extends ProductViewModelState {
  final int? numberOfBags;
  ChangeNumBadgeViewModelSuccess({required this.numberOfBags});
}

// ? add cart to Favorite
class AddToFavoriteViewModelLoading extends ProductViewModelState {}

class AddToFavoriteViewModelError extends ProductViewModelState {
  final String? errorMessage;
  AddToFavoriteViewModelError({required this.errorMessage});
}

class AddToFavoriteViewModelSuccess extends ProductViewModelState {}

//? get all favorite
class GetAllFavoriteViewModelLoading extends ProductViewModelState {}

class GetAllFavoriteViewModelError extends ProductViewModelState {
  final String? errorMessage;
  GetAllFavoriteViewModelError({required this.errorMessage});
}

class GetAllFavoriteViewModelSuccess extends ProductViewModelState {}
//? get category states

class GetAllCategoryViewModelLoading extends ProductViewModelState {}

class GetAllCategoryViewModelError extends ProductViewModelState {
  final String? errorMessage;
  GetAllCategoryViewModelError({required this.errorMessage});
}

class GetAllCategoryViewModelSuccess extends ProductViewModelState {}
//? get brand states

class GetAllBrandViewModelLoading extends ProductViewModelState {}

class GetAllBrandViewModelError extends ProductViewModelState {
  final String? errorMessage;
  GetAllBrandViewModelError({required this.errorMessage});
}

class GetAllBrandViewModelSuccess extends ProductViewModelState {
  final List<CategoryOrBrandDataEntity> listBrandData;
  GetAllBrandViewModelSuccess({required this.listBrandData});
}

//! get specific product states

class GetSpecificProductViewModelLoading extends ProductViewModelState {}

class GetSpecificProductViewModelError extends ProductViewModelState {
  final String? errorMessage;
  GetSpecificProductViewModelError({required this.errorMessage});
}

class GetSpecificProductViewModelSuccess extends ProductViewModelState {}

//? search states
class SearchTextInListViewModelSuccess extends ProductViewModelState {}
