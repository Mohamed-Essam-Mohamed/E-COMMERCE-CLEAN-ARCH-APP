import 'package:dartz/dartz.dart';
import '../../../data/models/request/auth_request/forgot_pass_request.dart';
import '../../../data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import '../../entities/auth_entities/fotgot_pass_response_entity.dart';
import '../../repository/auth_repository/repository/auth_repository_contract.dart';

import '../../../helper/failuers/failures.dart';

class ForgotPasswordUseCase {
  AuthRepositoryContract authRepositoryContract;
  ForgotPasswordUseCase({required this.authRepositoryContract});
  Future<Either<Failure, ForgotPasswordResponseEntity>> invoke(
      {required ForgotPasswordRequest forgotPassRequest}) {
    return authRepositoryContract.forgotPassword(forgotPassRequest);
  }
}

ForgotPasswordUseCase injectForgotPasswordUseCases() {
  return ForgotPasswordUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}
