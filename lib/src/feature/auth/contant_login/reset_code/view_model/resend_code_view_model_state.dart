part of 'resend_code_view_model_cubit.dart';

@immutable
sealed class ResetCodeViewModelState {}

final class ResetCodeViewModelInitial extends ResetCodeViewModelState {}

final class ResetCodeViewModelLoading extends ResetCodeViewModelState {}

final class ResetCodeViewModelError extends ResetCodeViewModelState {
  final String? errorMessage;
  ResetCodeViewModelError({this.errorMessage});
}

final class ResetCodeViewModelSuccess extends ResetCodeViewModelState {
  final ResetCodeResponseEntity? resetPasswordResponseEntity;
  ResetCodeViewModelSuccess({this.resetPasswordResponseEntity});
}

final class ResetCodeViewModelChangeCodeState extends ResetCodeViewModelState {}
