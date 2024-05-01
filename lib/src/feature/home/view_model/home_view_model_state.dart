part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}

final class HomeViewModelLoading extends HomeViewModelState {
  String message;
  HomeViewModelLoading({required this.message});
}

final class HomeViewModelError extends HomeViewModelState {
  String? errorMessage;
  HomeViewModelError({required this.errorMessage});
}

final class HomeViewModelSuccess extends HomeViewModelState {
  CategoryResponseEntity categoryResponseEntity;

  HomeViewModelSuccess({required this.categoryResponseEntity});
}
