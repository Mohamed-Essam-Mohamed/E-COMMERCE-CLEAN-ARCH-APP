import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/request/auth_request/register_request.dart';
import '../../../../domain/entities/auth_entities/auth_response_entities.dart';
import '../../../../domain/usecases/auth_usecases/rsegister_usecase.dart';

part 'register_screen_view_model_state.dart';

class RegisterViewModelCubit extends Cubit<RegisterViewModelState> {
  RegisterViewModelCubit({required this.registerUseCasese})
      : super(RegisterViewModelInitial());
  // todo : hold data - handle logic
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formState = GlobalKey<FormState>();

  RegisterUseCase registerUseCasese;
  void register() async {
    if (formState.currentState!.validate()) {
      emit(RegisterViewModelLoading(loadingMessage: "Loading..."));
      var either = await registerUseCasese.invoke(
        RegisterRequest(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          phone: "0${mobileController.text}",
          rePassword: passwordController.text,
        ),
      );
      either.fold((l) {
        emit(RegisterViewModelError(errorMessage: l.errorMessage));
      }, (Response) {
        emit(RegisterViewModelSuccess(authResponseEntity: Response));
      });
    }
  }
}
