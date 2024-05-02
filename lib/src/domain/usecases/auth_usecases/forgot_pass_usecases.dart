import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/model/request/auth_request/forgot_pass_request.dart';
import 'package:e_commerce/src/data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import 'package:e_commerce/src/domain/entities/fotgot_pass_response_entity.dart';
import 'package:e_commerce/src/domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../../helper/failuers/failures.dart';

class ForgotPasswordUseCases {
  AuthRepositoryContract authRepositoryContract;
  ForgotPasswordUseCases({required this.authRepositoryContract});
  Future<Either<Failure, ForgotPasswordResponseEntity>> invoke(
      ForgotPasswordRequest forgotPassRequest) {
    return authRepositoryContract.forgotPassword(forgotPassRequest);
  }
}

ForgotPasswordUseCases injectForgotPasswordUseCases() {
  return ForgotPasswordUseCases(
      authRepositoryContract: injectAuthRepositoryContract());
}
