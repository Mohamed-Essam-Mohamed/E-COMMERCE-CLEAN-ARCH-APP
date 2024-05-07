part of 'forgot_password_cubit.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {
  final String? message;
  ForgotPasswordLoading({required this.message});
}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final ForgotPasswordResponseEntity? forgotPasswordResponseEntity;
  ForgotPasswordSuccess({required this.forgotPasswordResponseEntity});
}

final class ForgotPasswordError extends ForgotPasswordState {
  final String? errorMessage;
  ForgotPasswordError({required this.errorMessage});
}
