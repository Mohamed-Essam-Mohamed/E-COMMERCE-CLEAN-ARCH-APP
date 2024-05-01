import 'package:dartz/dartz.dart';
import '../../../model/request/auth_request/login_request.dart';

import '../../../../domain/entities/auth_response_entities.dart';
import '../../../../helper/failuers/failures.dart';
import '../../../model/request/auth_request/register_request.dart';

import '../data_source/auth_data_source_imp.dart';
import '../../../../domain/repository/auth_repository/data_source/auth_remote_datasource_contract.dart';

import '../../../../domain/repository/auth_repository/repository/auth_repository_contract.dart';

class AuthRepositoruImp extends AuthRepositoryContract {
  AuthRemoteDataSourceContract authDataSourceContract;
  AuthRepositoruImp(this.authDataSourceContract);
  @override
  Future<Either<Failure, AuthResponseEntity>> register(
      RegisterRequest registerRequest) async {
    return authDataSourceContract.register(registerRequest);
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
      LoginRequest loginRequest) async {
    return authDataSourceContract.login(loginRequest);
  }
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoruImp(injectAuthRemoteDataSource());
}
