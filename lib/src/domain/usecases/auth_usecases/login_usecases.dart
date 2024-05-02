import 'package:dartz/dartz.dart';
import '../../../data/model/request/auth_request/login_request.dart';

import '../../../data/repositorys/auth_repository/repository/auth_repsitory_imp.dart';
import '../../repository/auth_repository/repository/auth_repository_contract.dart';

import '../../entities/auth_response_entities.dart';
import '../../../helper/failuers/failures.dart';

class LoginUseCases {
  AuthRepositoryContract authRepositoryContract;
  LoginUseCases({required this.authRepositoryContract});
  Future<Either<Failure, AuthResponseEntity?>> invoke(
    LoginRequest loginRequest,
  ) {
    return authRepositoryContract.login(loginRequest);
  }
}

LoginUseCases injcectLoginUseCasese() {
  return LoginUseCases(authRepositoryContract: injectAuthRepositoryContract());
}
