part of 'login_view_model_cubit.dart';

@immutable
sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

final class LoginViewModelLoading extends LoginViewModelState {}

final class LoginViewModelError extends LoginViewModelState {
  String? errorMessage;
  LoginViewModelError({required this.errorMessage});
}

final class LoginViewModelSuccess extends LoginViewModelState {
  AuthResponseEntity? authResponseEntity;
  LoginViewModelSuccess({required this.authResponseEntity});
}
