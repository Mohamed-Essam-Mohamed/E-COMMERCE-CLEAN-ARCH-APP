import 'package:dartz/dartz.dart';
import '../../data/model/request/auth_request/register_request.dart';
import '../../data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import '../repository/repository/auth_repository_contract.dart';

import '../entities/auth_response_entities.dart';
import '../../helper/failuers/failures.dart';

class RegisterUseCasese {
  AuthRepositoryContract authRepositoryContract;
  RegisterUseCasese({required this.authRepositoryContract});
  Future<Either<Failuer, AuthResponseEntity?>> inVoik(
      RegisterRequest registerRequest) {
    return authRepositoryContract.register(registerRequest);
  }
}

RegisterUseCasese injcectRegisterUseCasese() {
  return RegisterUseCasese(
      authRepositoryContract: injectAuthRepositoryContract());
}
