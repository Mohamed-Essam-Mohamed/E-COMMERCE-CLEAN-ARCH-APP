import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/data/firebase/app_firebase.dart';
import 'package:e_commerce/src/data/models/firebase_model/app_user.dart';
import 'package:e_commerce/src/feature/notification/class_basic_notification_package/class_basic_notification_package.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/request/auth_request/register_request.dart';
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
  File? image;

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
      }, (response) async {
        String _token = response!.token!;
        await AppFirebase.addImageProfile(
          childName: "profile",
          path: image!,
          authIdUser: _token,
        );
        String _imageUrl = await AppFirebase.getUrlImageProfile(
          childName: "profile",
          uint8List: convertImageToUint8List(image),
          currentUser: _token,
        );
        AppUser _appUser = AppUser(
          email: emailController.text,
          fullName: nameController.text,
          phone: "0${mobileController.text}",
          imageUrl: _imageUrl,
          token: _token,
        );

        await AppFirebase.addUser(_appUser);
        await ClassBasicNotificationPackage().showBasicNotification(
          title: 'Welcome TOKOTO',
          body: 'TOKOTO APP Where All New With Us',
          id: 0,
          payload: 'Welcome TOKOTO',
        );
        emit(RegisterViewModelSuccess(authResponseEntity: response));
      });
    }
  }

  Uint8List convertImageToUint8List(File? image) {
    if (image != null) {
      return image.readAsBytesSync();
    }
    return Uint8List(0);
  }
}
