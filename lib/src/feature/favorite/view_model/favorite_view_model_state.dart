part of 'favorite_view_model_cubit.dart';

@immutable
sealed class FavoriteViewModelState {}

class FavoriteViewModelInitial extends FavoriteViewModelState {}

class FavoriteViewModelLoading extends FavoriteViewModelState {}

class FavoriteViewModelErorer extends FavoriteViewModelState {
  String? messageError;

  FavoriteViewModelErorer({required this.messageError});
}

class FavoriteViewModelSuccess extends FavoriteViewModelState {
  List<FavoriteDataEntity>? favoriteDataEntity;

  FavoriteViewModelSuccess({required this.favoriteDataEntity});
}
