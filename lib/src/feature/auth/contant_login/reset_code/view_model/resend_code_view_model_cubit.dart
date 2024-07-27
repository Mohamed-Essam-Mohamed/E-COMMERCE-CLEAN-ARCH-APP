import 'package:bloc/bloc.dart';
import '../../../../../data/model/request/auth_request/resset_code_request.dart';
import '../../../../../domain/entities/auth_entities/reset_code_response_entity.dart';
import '../../../../../domain/usecases/auth_usecases/reset_code_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'resend_code_view_model_state.dart';

class ResetCodeViewModelCubit extends Cubit<ResetCodeViewModelState> {
  ResetCodeViewModelCubit({required this.resetCodeUseCases})
      : super(ResetCodeViewModelInitial());
  String code = '';
  GlobalKey<FormState> fromState = GlobalKey();
  ResetCodeUseCase resetCodeUseCases;

  void resetCode() async {
    if (fromState.currentState!.validate()) {
      emit(ResetCodeViewModelLoading());
      var either =
          await resetCodeUseCases.invoke(ResetCodeRequest(resetCode: code));
      return either.fold((l) {
        emit(ResetCodeViewModelError(errorMessage: l.errorMessage));
      }, (r) {
        emit(ResetCodeViewModelSuccess(resetPasswordResponseEntity: r));
      });
    }
  }
}
