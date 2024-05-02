import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/data/model/request/auth_request/forgot_pass_request.dart';
import 'package:e_commerce/src/domain/entities/fotgot_pass_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/auth_usecases/forgot_pass_usecases.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required this.forgotPasswordUseCases})
      : super(ForgotPasswordInitial());
  var emailController = TextEditingController();
  GlobalKey<FormState> fromState = GlobalKey();
  ForgotPasswordUseCases forgotPasswordUseCases;
  void forgotPassword() async {
    if (fromState.currentState!.validate()) {
      emit(ForgotPasswordLoading(message: "Loading..."));
      var either = await forgotPasswordUseCases.invoke(
          forgotPassRequest: ForgotPasswordRequest(
        email: emailController.text,
      ));
      return either.fold((l) {
        emit(ForgotPasswordError(errorMessage: l.errorMessage));
      }, (response) {
        emit(ForgotPasswordSuccess(forgotPasswordResponseEntity: response));
      });
    }
  }
}
