import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/model/request/auth_request/reset_pass_request.dart';
import 'package:e_commerce/src/data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import 'package:e_commerce/src/domain/entities/reset_pass_response_entity.dart';
import 'package:e_commerce/src/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import '../../../helper/failuers/failures.dart';

class ResetPasswordUseCase {
  AuthRepositoryContract authRepositoryContract;
  ResetPasswordUseCase({required this.authRepositoryContract});

  Future<Either<Failure, ResetPasswordResponseEntity>> invoke(
      ResetPasswordRequest resetPasswordRequest) {
    return authRepositoryContract.resetPassword(resetPasswordRequest);
  }
}

ResetPasswordUseCase injectResetPasswordUseCases() {
  return ResetPasswordUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}
