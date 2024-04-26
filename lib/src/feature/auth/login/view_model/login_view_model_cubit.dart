import 'package:bloc/bloc.dart';
import '../../../../data/model/request/auth_request/login_request.dart';
import '../../../../domain/entities/auth_response_entities.dart';
import '../../../../domain/usecases/login_usecases.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_view_model_state.dart';

class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  LoginViewModelCubit({required this.loginUseCasese})
      : super(LoginViewModelInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> fromState = GlobalKey();
  LoginUseCasese loginUseCasese;
  void login() async {
    if (fromState.currentState!.validate()) {
      emit(LoginViewModelLoading());
      var either = await loginUseCasese.inVoik(LoginRequest(
          email: emailController.text, password: passwordController.text));
      return either.fold((l) {
        emit(LoginViewModelError(errorMessage: l.errorMessage));
      }, (Response) {
        emit(LoginViewModelSuccess(authResponseEntity: Response));
      });
    }
  }
}
