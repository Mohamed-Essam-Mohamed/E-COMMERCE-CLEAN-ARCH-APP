part of 'product_view_model_cubit.dart';

@immutable
sealed class ProductViewModelState {}

final class ProductViewModelInitial extends ProductViewModelState {}

final class ProductViewModelLoading extends ProductViewModelState {
  final String message;
  ProductViewModelLoading({required this.message});
}

final class ProductViewModelError extends ProductViewModelState {
  final String? errorMessage;
  ProductViewModelError({required this.errorMessage});
}

final class ProductViewModelSuccess extends ProductViewModelState {
  final ProductResponseEntity productResponseEntity;

  ProductViewModelSuccess({required this.productResponseEntity});
}

//? add to cart states
final class AddToCartInitial extends ProductViewModelState {}

final class AddToCartViewModelLoading extends ProductViewModelState {
  final String? message;
  AddToCartViewModelLoading({required this.message});
}

final class AddToCartViewModelError extends ProductViewModelState {
  final String? errorMessage;
  AddToCartViewModelError({required this.errorMessage});
}

final class AddToCartViewModelSuccess extends ProductViewModelState {
  final AddToCartResponseEntity addToCartResponseEntity;
  AddToCartViewModelSuccess({required this.addToCartResponseEntity});
}

//?  number of badge states

final class ChangeNumBadgeViewModelLoading extends ProductViewModelState {
  final String? message;
  ChangeNumBadgeViewModelLoading({required this.message});
}

final class ChangeNumBadgeViewModelError extends ProductViewModelState {
  final String? errorMessage;
  ChangeNumBadgeViewModelError({required this.errorMessage});
}

final class ChangeNumBadgeViewModelSuccess extends ProductViewModelState {
  final int? numberOfBages;
  ChangeNumBadgeViewModelSuccess({required this.numberOfBages});
}

// ? add cart to Favorite
final class AddToFavoriteViewModelLoading extends ProductViewModelState {
  final String? message;
  AddToFavoriteViewModelLoading({required this.message});
}

final class AddToFavoriteViewModelError extends ProductViewModelState {
  final String? errorMessage;
  AddToFavoriteViewModelError({required this.errorMessage});
}

final class AddToFavoriteViewModelSuccess extends ProductViewModelState {
  AddToFavoriteResponseEntity addToFavoriteResponseEntity;
  AddToFavoriteViewModelSuccess({required this.addToFavoriteResponseEntity});
}
