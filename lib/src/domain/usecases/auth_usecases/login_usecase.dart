import 'package:dartz/dartz.dart';

import '../../../data/models/request/auth_request/login_request.dart';
import '../../../data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import '../../../helper/failuers/failures.dart';
import '../../entities/auth_entities/auth_response_entities.dart';
import '../../repository/auth_repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;
  LoginUseCase({required this.authRepositoryContract});
  Future<Either<Failure, AuthResponseEntity?>> invoke(
    LoginRequest loginRequest,
  ) {
    return authRepositoryContract.login(loginRequest);
  }
}

LoginUseCase injcectLoginUseCasese() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}
