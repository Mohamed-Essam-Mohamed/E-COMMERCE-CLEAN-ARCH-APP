import 'package:dartz/dartz.dart';
import '../../../data/model/request/auth_request/register_request.dart';
import '../../../data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import '../../repository/auth_repository/repository/auth_repository_contract.dart';

import '../../entities/auth_response_entities.dart';
import '../../../helper/failuers/failures.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepositoryContract;
  RegisterUseCase({required this.authRepositoryContract});
  Future<Either<Failure, AuthResponseEntity?>> invoke(
      RegisterRequest registerRequest) {
    return authRepositoryContract.register(registerRequest);
  }
}

RegisterUseCase injcectRegisterUseCasese() {
  return RegisterUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}
