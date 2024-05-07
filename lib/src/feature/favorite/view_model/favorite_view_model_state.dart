part of 'favorite_view_model_cubit.dart';

@immutable
sealed class FavoriteViewModelState {}

class FavoriteViewModelInitial extends FavoriteViewModelState {}

class FavoriteViewModelLoading extends FavoriteViewModelState {
  final String? message;

  FavoriteViewModelLoading({required this.message});
}

class FavoriteViewModelErorer extends FavoriteViewModelState {
  final String? messageError;

  FavoriteViewModelErorer({required this.messageError});
}

class FavoriteViewModelSuccess extends FavoriteViewModelState {
  List<FavoriteDataEntity>? favoriteDataEntity;

  FavoriteViewModelSuccess({required this.favoriteDataEntity});
}
