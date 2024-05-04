import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/model/request/auth_request/resset_code_request.dart';
import 'package:e_commerce/src/data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import 'package:e_commerce/src/domain/entities/reset_code_response_entity.dart';
import 'package:e_commerce/src/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class ResetCodeUseCase {
  AuthRepositoryContract authRepositoryContract;
  ResetCodeUseCase({required this.authRepositoryContract});
  Future<Either<Failure, ResetCodeResponseEntity>> invoke(
      ResetCodeRequest resetCodeRequest) async {
    return await authRepositoryContract.resetCode(resetCodeRequest);
  }
}

ResetCodeUseCase injectResetCodeUseCases() {
  return ResetCodeUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}
