part of 'reset_password_view_model_cubit.dart';

@immutable
sealed class ResetPasswordViewModelState {}

final class ResetPasswordViewModelInitial extends ResetPasswordViewModelState {}

final class ResetPasswordViewModelLoading extends ResetPasswordViewModelState {}

final class ResetPasswordViewModelError extends ResetPasswordViewModelState {
  final String? errorMessage;
  ResetPasswordViewModelError({required this.errorMessage});
}

final class ResetPasswordViewModelSuccess extends ResetPasswordViewModelState {
  final ResetPasswordResponseEntity? resetPasswordResponseEntity;
  ResetPasswordViewModelSuccess({required this.resetPasswordResponseEntity});
}
