import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/feature/notification/class_basic_notification_package/class_basic_notification_package.dart';
import '../../../../../data/models/request/auth_request/login_request.dart';
import '../../../../../domain/entities/auth_entities/auth_response_entities.dart';
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
      }, (response) async {
        await ClassBasicNotificationPackage().showBasicNotification(
          title: 'Welcome Again TOKOTO',
          body: 'TOKOTO APP Where All New With Us',
          id: 0,
          payload: 'Welcome TOKOTO',
        );
        emit(LoginViewModelSuccess(authResponseEntity: response));
      });
    }
  }
}
