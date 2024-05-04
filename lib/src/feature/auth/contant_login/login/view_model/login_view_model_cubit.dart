import 'package:bloc/bloc.dart';
import '../../../../../data/model/request/auth_request/login_request.dart';
import '../../../../../domain/entities/auth_response_entities.dart';
import '../../../../../domain/usecases/auth_usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_view_model_state.dart';

class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  LoginViewModelCubit({required this.loginUseCases})
      : super(LoginViewModelInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> fromState = GlobalKey();
  LoginUseCase loginUseCases;
  void login() async {
    if (fromState.currentState!.validate()) {
      emit(LoginViewModelLoading());
      var either = await loginUseCases.invoke(LoginRequest(
          email: emailController.text, password: passwordController.text));
      return either.fold((l) {
        emit(LoginViewModelError(errorMessage: l.errorMessage));
      }, (Response) {
        emit(LoginViewModelSuccess(authResponseEntity: Response));
      });
    }
  }
}
