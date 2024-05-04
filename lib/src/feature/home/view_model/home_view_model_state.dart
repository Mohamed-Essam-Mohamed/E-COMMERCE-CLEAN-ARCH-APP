part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}

final class CategoryViewModelLoading extends HomeViewModelState {
  String message;
  CategoryViewModelLoading({required this.message});
}

final class CatergoryViewModelError extends HomeViewModelState {
  String? errorMessage;
  CatergoryViewModelError({required this.errorMessage});
}

final class CategoryViewModelSuccess extends HomeViewModelState {
  CategoryResponseEntity categoryResponseEntity;

  CategoryViewModelSuccess({required this.categoryResponseEntity});
}
