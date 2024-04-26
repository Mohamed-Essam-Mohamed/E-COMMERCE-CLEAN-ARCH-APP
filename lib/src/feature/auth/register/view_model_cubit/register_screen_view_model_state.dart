part of 'register_screen_view_model_cubit.dart';

@immutable
abstract class RegisterViewModelState {}

class RegisterViewModelInitial extends RegisterViewModelState {}

class RegisterViewModelLoading extends RegisterViewModelState {
  String? loadingMessage;
  RegisterViewModelLoading({required this.loadingMessage});
}

class RegisterViewModelError extends RegisterViewModelState {
  String? errorMessage;
  RegisterViewModelError({required this.errorMessage});
}

class RegisterViewModelSuccess extends RegisterViewModelState {
  AuthResponseEntity? authResponseEntity;
  RegisterViewModelSuccess({required this.authResponseEntity});
}
