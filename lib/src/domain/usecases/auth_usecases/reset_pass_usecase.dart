import 'package:dartz/dartz.dart';
import '../../../data/models/request/auth_request/reset_pass_request.dart';
import '../../../data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import '../../entities/auth_entities/reset_pass_response_entity.dart';
import '../../repository/auth_repository/repository/auth_repository_contract.dart';
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
