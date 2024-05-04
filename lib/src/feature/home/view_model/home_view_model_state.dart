part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}

final class HomeViewModelLoading extends HomeViewModelState {
  final String message;
  HomeViewModelLoading({required this.message});
}

final class HomeViewModelError extends HomeViewModelState {
  final String? errorMessage;
  HomeViewModelError({required this.errorMessage});
}

final class HomeViewModelSuccess extends HomeViewModelState {
  final CategoryOrBrandResponseEntity categoryResponseEntity;

  HomeViewModelSuccess({required this.categoryResponseEntity});
}
