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
