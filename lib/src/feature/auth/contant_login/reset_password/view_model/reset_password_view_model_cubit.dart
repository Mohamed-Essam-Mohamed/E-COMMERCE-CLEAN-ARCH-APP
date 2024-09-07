import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/request/auth_request/reset_pass_request.dart';
import '../../../../../domain/entities/auth_entities/reset_pass_response_entity.dart';
import '../../../../../domain/usecases/auth_usecases/reset_pass_usecase.dart';

part 'reset_password_view_model_state.dart';

class ResetPasswordViewModelCubit extends Cubit<ResetPasswordViewModelState> {
  ResetPasswordViewModelCubit({required this.resetPasswordUseCases})
      : super(ResetPasswordViewModelInitial());
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  GlobalKey<FormState> fromState = GlobalKey();
  ResetPasswordUseCase resetPasswordUseCases;
  void resetPassword({required String email}) async {
    if (fromState.currentState!.validate()) {
      fromState.currentState!.reset();
      emit(ResetPasswordViewModelLoading());
      var either = await resetPasswordUseCases.invoke(ResetPasswordRequest(
          email: email, newPassword: passwordController?.text));
      return either.fold((l) {
        emit(ResetPasswordViewModelError(errorMessage: l.errorMessage));
      }, (response) {
        emit(ResetPasswordViewModelSuccess(
            resetPasswordResponseEntity: response));
      });
    }
  }
}
