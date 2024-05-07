part of 'register_screen_view_model_cubit.dart';

@immutable
abstract class RegisterViewModelState {}

class RegisterViewModelInitial extends RegisterViewModelState {}

class RegisterViewModelLoading extends RegisterViewModelState {
  final String? loadingMessage;
  RegisterViewModelLoading({required this.loadingMessage});
}

class RegisterViewModelError extends RegisterViewModelState {
  final String? errorMessage;
  RegisterViewModelError({required this.errorMessage});
}

class RegisterViewModelSuccess extends RegisterViewModelState {
  final AuthResponseEntity? authResponseEntity;
  RegisterViewModelSuccess({required this.authResponseEntity});
}
