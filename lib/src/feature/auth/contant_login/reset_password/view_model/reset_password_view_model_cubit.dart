import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/data/model/request/auth_request/register_request.dart';
import 'package:e_commerce/src/data/model/request/auth_request/reset_pass_request.dart';
import 'package:e_commerce/src/domain/entities/reset_pass_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/auth_usecases/reset_pass_usecases.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reset_password_view_model_state.dart';

class ResetPasswordViewModelCubit extends Cubit<ResetPasswordViewModelState> {
  ResetPasswordViewModelCubit({required this.resetPasswordUseCases})
      : super(ResetPasswordViewModelInitial());
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  GlobalKey<FormState> fromState = GlobalKey();
  ResetPasswordUseCases resetPasswordUseCases;
  void resetPassword({required String email}) async {
    if (fromState.currentState!.validate()) {
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